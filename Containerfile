FROM docker.io/mikefarah/yq:4.53.3 as yq

# ---

FROM docker.io/debian:13.0-slim@sha256:c85a2732e97694ea77237c61304b3bb410e0e961dd6ee945997a06c788c545bb

RUN apt update \
  && apt install -y --no-install-recommends \
    ca-certificates \
    curl \
    jq \
    tzdata \
    wget \
  && rm -rf /var/lib/apt/lists/*

COPY --from=yq /usr/bin/yq /usr/bin/yq

LABEL image.registry=ghcr.io
LABEL image.name=markormesher/toolbox
