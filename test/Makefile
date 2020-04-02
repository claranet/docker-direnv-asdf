# http://clarkgrubb.com/makefile-style-guide

MAKEFLAGS += --warn-undefined-variables --no-print-directory
SHELL := bash
.SHELLFLAGS := -eu -o pipefail -c
.DEFAULT_GOAL := test
.DELETE_ON_ERROR:
.SUFFIXES:

tag = claranet/direnv-asdf

.PHONY: test
test:
	mkdir -p .direnv .docker/.direnv .docker/home
	docker run --rm \
		-v $(PWD):/src \
		-v $(PWD)/.docker/.direnv:/src/.direnv \
		-v $(PWD)/.docker/home:$(HOME) \
		-v ~/.aws/config:/tmp/aws-config:ro \
		-e AWS_CONFIG_FILE=/tmp/aws-config \
		-v ~/.aws/credentials:/tmp/aws-credentials:ro \
		-e AWS_SHARED_CREDENTIALS_FILE=/tmp/aws-credentials \
		-v /etc/passwd:/etc/passwd:ro \
		-v /etc/group:/etc/group:ro \
		-u $$(id -u):$$(id -g) \
		-w /src/subdir \
		$(tag) \
		bash ../test.sh
