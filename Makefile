.PHONY: lint scrape

scrape: ./data/columns.tsv
./data/columns.tsv: ./index.ts ./package.json ./pnpm-lock.yaml
	pnpx esbuild ./index.ts --format=cjs | node
lint:
	pnpx tsc --noEmit --strict ./index.ts ./scripts/make_erd.ts
clean:
	rm -f ./data/*.tsv ./data/**/*.tsv
erd: ./data/columns.tsv
	pnpx esbuild ./scripts/make_erd.ts --format=cjs | node
