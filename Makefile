tarfile := $(shell mktemp -t twitch-builder.XXXXXXXXXXX)

.PHONY: build-builder
build-builder:
	docker build -t twitch-builder -f Dockerfile.builder .
.PHONY: lint
lint: build-builder
	docker run --network=host twitch-builder lint
.PHONY: test
test: build-builder
	docker run --network=host twitch-builder test
.PHONY: build
build: build-builder
	docker run --network=host twitch-builder >$(tarfile)
	docker build -t dbresson/twitch - <$(tarfile)
