.PHONY: all lint scrape observe combine erd clean site services

all: combine

site: ./data/site/license.txt
./data/site/license.txt: ./data/site/site.tar.gz
	rm -rf ./data/site/{about,dyncss,docs,media,license.txt}
	tar -xf ./data/site/site.tar.gz -C ./data/site
	touch -m ./data/site/license.txt
./data/site/site.tar.gz:
	./scripts/download_site_archive.js

bin/scrape: ./scripts/scrape_site/* pkg/common/* pkg/tsv_utils/*
	go build -o bin/scrape ./scripts/scrape_site/main.go
bin/observe: ./scripts/observe_containers/* pkg/common/* pkg/tsv_utils/*
	go build -o bin/observe ./scripts/observe_containers/main.go
bin/combine: ./scripts/combine/* pkg/common/* pkg/tsv_utils/*
	go build -o bin/combine ./scripts/combine/main.go

services:
	docker compose up --wait --wait-timeout 60

scrape: ./data/scraped/10/catalog/pg_class.tsv
./data/scraped/10/catalog/pg_class.tsv: ./data/site/license.txt ./bin/scrape
	LOG_LEVEL=INFO ./bin/scrape

observe: ./data/observed/10/catalog/pg_class.tsv
./data/observed/10/catalog/pg_class.tsv: ./bin/observe services
	LOG_LEVEL=INFO ./bin/observe

combine: ./data/columns.tsv
./data/columns.tsv: ./bin/combine ./data/scraped/10/catalog/pg_class.tsv ./data/observed/10/catalog/pg_class.tsv
	rm -rf ./data/combined ./data/columns.tsv ./data/tables.tsv
	LOG_LEVEL=DEBUG ./bin/combine

lint:
	pnpx tsc --noEmit --strict ./index.ts ./scripts/make_erd.ts
clean:
	rm -f ./data/*.tsv ./data/**/*.tsv
./erd.mmd: ./data/columns.tsv ./scripts/make_erd.ts ./package.json
	pnpx esbuild ./scripts/make_erd.ts --format=cjs | node > ./erd.mmd
./erd.svg: ./erd.mmd
	pnpx mmdc -i ./erd.mmd -o erd.svg
erd: ./erd.svg
