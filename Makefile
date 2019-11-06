deps:
	@go get

lint:
	@golangci-lint run -v

test:
	@go test -coverprofile=cover.out -v ./...

cov:
	@go tool cover -html=cover.out

build:
	@go build .

release:
	@goreleaser $(GORELEASER_ARGS)

snapshot: GORELEASER_ARGS= --rm-dist --snapshot
snapshot: release

todo:
	@grep \
		--exclude-dir=vendor \
		--exclude-dir=dist \
		--exclude-dir=Attic \
		--text \
		--color \
		-nRo -E 'TODO:.*' .

.PHONY: build build-linux test snapshot todo