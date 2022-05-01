.PHONY: lint scrape

scrape: ./data/columns.tsv
./data/columns.tsv: ./index.ts ./package.json ./pnpm-lock.yaml
	pnpx esbuild ./index.ts --format=cjs | node
lint:
	pnpx tsc --noEmit --strict ./index.ts ./scripts/make_erd.ts
clean:
	rm -f ./data/*.tsv ./data/**/*.tsv
./erd.mmd: ./data/columns.tsv ./scripts/make_erd.ts ./package.json
	pnpx esbuild ./scripts/make_erd.ts --format=cjs | node > ./erd.mmd
./erd.svg: ./erd.mmd
	pnpx mmdc -i ./erd.mmd -o erd.svg
erd: ./erd.svg
