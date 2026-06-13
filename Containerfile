FROM docker.io/debian:13.0-slim@sha256:c85a2732e97694ea77237c61304b3bb410e0e961dd6ee945997a06c788c545bb

RUN apt update \
  && apt install -y --no-install-recommends \
    ca-certificates \
    curl \
    jq \
    tzdata \
    wget \
    yq \
  && rm -rf /var/lib/apt/lists/*

LABEL image.registry=ghcr.io
LABEL image.name=markormesher/toolbox
