FROM petzi/pre-commit:1.15.2
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    docker-compose \
    shellcheck \
    yamllint \
    && rm -rf /var/lib/apt/lists/*
COPY .pre-commit-config.yaml .
