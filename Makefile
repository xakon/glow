# This Makefile is just for development purposes

.PHONY: default clean glow run log release

VERSION	:= $(shell git describe)
COMMIT	:= $(shell git rev-parse HEAD)

default: glow

clean:
	rm -f ./glow

glow:
	go build

run: clean glow
	./glow
release: glow
	go build \
	   -ldflags "-X main.Version=${VERSION} -X main.CommitSHA=${COMMIT}"
	strip glow

log:
	tail -f ~/.cache/glow/glow.log
