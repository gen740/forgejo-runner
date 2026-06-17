FROM ubuntu:24.04

LABEL org.opencontainers.image.title="forgejo-runner"
LABEL org.opencontainers.image.description="Minimal Ubuntu 24.04 image with Node.js for Forgejo Actions jobs"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        bash \
        ca-certificates \
        curl \
        git \
        nodejs \
        npm \
    && rm -rf /var/lib/apt/lists/*

CMD ["/bin/bash"]
