# Makefile for petzi/docker-pre-commit
# Make targets to help in the development of this docker image

.DEFAULT_GOAL := help

# Docker configuration
DOCKER=docker
# Docker build configuration
DOCKER_TAG=petzi/pre-commit-common

# Docker run configuration for the main image
DOCKER_VOL=-v "${PWD}:/src"
DOCKER_WD=-w "/src"
DOCKER_RUN_TEST=$(DOCKER) run --rm $(DOCKER_VOL) $(DOCKER_WD)

# The help command is inspired by this post:
# https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: build
build:  ## Build the images on development
	$(DOCKER) build -t $(DOCKER_TAG) .

.PHONY: test
test: ## Run each image once to test the build result
	$(DOCKER_RUN_TEST) $(DOCKER_TAG) --all-files
