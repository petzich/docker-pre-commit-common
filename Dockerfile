FROM petzi/pre-commit:1.15.2
ENTRYPOINT ["pre-commit", "run", "--config", "/.pre-commit-config.yaml"]
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    docker-compose \
    shellcheck \
    yamllint \
    && rm -rf /var/lib/apt/lists/*
COPY .pre-commit-config.yaml /
COPY --from=mvdan/shfmt:v2.6.4 /bin/shfmt /usr/local/bin/
