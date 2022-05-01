.PHONY: lint scrape

scrape: ./data/columns.tsv
./data/columns.tsv: ./index.ts ./package.json ./pnpm-lock.yaml
	pnpx esbuild ./index.ts --format=cjs | node
lint:
	pnpx tsc --noEmit --strict ./index.ts ./scripts/make_erd.ts
clean:
	rm -f ./data/*.tsv ./data/**/*.tsv
./erd.md: ./data/columns.tsv ./scripts/make_erd.ts ./package.json
	pnpx esbuild ./scripts/make_erd.ts --format=cjs | node > ./erd.md
erd: ./erd.md
