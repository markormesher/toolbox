FROM docker.io/mikefarah/yq:4.54.2@sha256:5d56494617dce8311106e905aac5c080a2087c905a7f7de2984db2e2cc60ab2e AS yq

# ---

FROM docker.io/debian:13.7-slim@sha256:a72b4433de1cf7d6bae0c4cee74d0547f58601a643b3375f070c51600d63b6b2 AS dyff

WORKDIR /work

RUN apt update && apt install -y --no-install-recommends ca-certificates wget
RUN wget https://github.com/homeport/dyff/releases/download/v1.12.0/dyff_1.12.0_linux_amd64.tar.gz -O dyff.tgz
RUN tar xf dyff.tgz

# ---

FROM docker.io/debian:13.7-slim@sha256:a72b4433de1cf7d6bae0c4cee74d0547f58601a643b3375f070c51600d63b6b2

RUN apt update \
  && apt install -y --no-install-recommends \
    ca-certificates \
    curl \
    git \
    jq \
    netcat-openbsd \
    rsync \
    tzdata \
    wget \
  && rm -rf /var/lib/apt/lists/*

COPY --from=yq /usr/bin/yq /usr/bin/yq
COPY --from=dyff /work/dyff /usr/bin/dyff

LABEL image.name=markormesher/toolbox
LABEL image.registry=ghcr.io
LABEL org.opencontainers.image.description=""
LABEL org.opencontainers.image.documentation=""
LABEL org.opencontainers.image.title="toolbox"
LABEL org.opencontainers.image.url=""
LABEL org.opencontainers.image.vendor=""
LABEL org.opencontainers.image.version=""
