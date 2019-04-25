# docker-pre-commit-common
A docker image containing pre-commit along with useful tools for many projects

## Tools included

1. docker-compose
1. shellcheck
1. shfmt
1. yamllint

## Quickstart

Switch into your source code directory (git) and run:

```
docker run --rm -it -v "${PWD}:/src" -w /src petzi/pre-commit-common:latest
```

## Fixing shfmt formatting

There is a pre-commit rule installed to fix shfmt formatting. It is defined for manual runs only, so you will have to use a command like this:

```
docker run --rm -it -v "${PWD}:/src" -w /src petzi/pre-commit-common --hook-stage manual shfmt-fix
```
