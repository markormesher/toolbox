FROM docker.io/mikefarah/yq:4.53.3 as yq

# ---

FROM docker.io/debian:13.5-slim@sha256:4e401d95de7083948053197a9c3913343cd06b706bf15eb6a0c3ccd26f436a0e

RUN apt update \
  && apt install -y --no-install-recommends \
    ca-certificates \
    curl \
    jq \
    tzdata \
    wget \
  && rm -rf /var/lib/apt/lists/*

COPY --from=yq /usr/bin/yq /usr/bin/yq

LABEL image.name=markormesher/toolbox
LABEL image.registry=ghcr.io
LABEL org.opencontainers.image.description=""
LABEL org.opencontainers.image.documentation=""
LABEL org.opencontainers.image.title="toolbox"
LABEL org.opencontainers.image.url=""
LABEL org.opencontainers.image.vendor=""
LABEL org.opencontainers.image.version=""
