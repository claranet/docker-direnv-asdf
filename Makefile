# http://clarkgrubb.com/makefile-style-guide

MAKEFLAGS += --warn-undefined-variables --no-print-directory
SHELL := bash
.SHELLFLAGS := -eu -o pipefail -c
.DEFAULT_GOAL := all
.DELETE_ON_ERROR:
.SUFFIXES:

tag = claranet/direnv-asdf

.PHONY: all
all: latest

.PHONY: latest
latest:
	docker build --tag $(tag):latest .

.PHONY: test
test: latest
	cd test && make

.PHONY: push
push:
	docker push $(tag):latest
