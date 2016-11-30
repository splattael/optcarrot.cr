CRYSTAL_BIN ?= $(shell which crystal)
PREFIX ?= $(CURDIR)

all: spec

build:
	$(CRYSTAL_BIN) build --release bin/optcarrot

spec:
	$(CRYSTAL_BIN) spec

update:
	shards check || shards update

clean:
	rm -fr .crystal

release:
	git commit -av -m "Release v${VERSION}" && \
	git tag -f v${VERSION} && \
	git push && \
	git push --tags -f

.PHONY: spec clean
