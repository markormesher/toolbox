FROM docker.io/mikefarah/yq:4.54.1@sha256:4b3d9475d65571d28cbb19544d3820ec2945e4c8b2f18279394282b8dc3a592e AS yq

# ---

FROM docker.io/debian:13.7-slim@sha256:89c1ea91e897f0fe0a3731595330bc45b8bdef4047464a07116f891a94054b31 AS dyff

WORKDIR /work

RUN apt update && apt install -y --no-install-recommends ca-certificates wget
RUN wget https://github.com/homeport/dyff/releases/download/v1.12.0/dyff_1.12.0_linux_amd64.tar.gz -O dyff.tgz
RUN tar xf dyff.tgz

# ---

FROM docker.io/debian:13.7-slim@sha256:89c1ea91e897f0fe0a3731595330bc45b8bdef4047464a07116f891a94054b31

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
