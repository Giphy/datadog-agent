.PHONY: dep build generate clean

GOOS = linux
GOARCH = amd64
TAG = $(shell git describe --tags --always --abbrev=0)
COMMIT = $(shell git rev-parse --short HEAD)
CODENAME = hotwings

dep:
	dep ensure

build:
	GOOS=$(GOOS) GOARCH=$(GOARCH) go build \
                -ldflags "-X github.com/DataDog/datadog-agent/pkg/version.Commit=$(COMMIT) \
                          -X github.com/DataDog/datadog-agent/pkg/version.AgentVersion=$(TAG)+$(CODENAME)" \
                -o cmd/dogstatsd/dist/dogstatsd_$(GOOS)_$(GOARCH) \
		cmd/dogstatsd/{main.go,main_nix.go}

build-darwin: GOOS=darwin
build-darwin: build

generate:
	go generate cmd/dogstatsd/*.go

clean:
	rm -rf cmd/dogstatsd/dist/*
