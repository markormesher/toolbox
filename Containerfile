FROM docker.io/mikefarah/yq:4.53.6@sha256:cfc4eee658595834ef304eadb0c3ea721f3b7cb6404ad8b7cb909cc5b5145b23 as yq

# ---

FROM docker.io/debian:13.7-slim@sha256:a99cfc517144bc59b1978475ec53b46ecabec7e43635402ee5b77cc54cd1b20a

RUN apt update \
  && apt install -y --no-install-recommends \
    ca-certificates \
    curl \
    git \
    jq \
    rsync \
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
