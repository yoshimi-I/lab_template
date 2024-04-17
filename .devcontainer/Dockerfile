FROM python:3.12-slim as builder

WORKDIR /opt
ENV RYE_HOME="/opt/rye"
ENV PATH="$RYE_HOME/shims:$PATH"

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    gcc python3-dev \
    ca-certificates \
    curl \
    git \
    nodejs \
    npm \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN curl -sSf https://rye-up.com/get | RYE_INSTALL_OPTION="--yes" bash && \
    rye config --set-bool behavior.global-python=true && \
    rye config --set-bool behavior.use-uv=true

WORKDIR /workspaces/lab_template
COPY ./.python-version ./pyproject.toml ./requirements* ./

RUN rye pin "$(cat .python-version)" && \
    rye sync

COPY package.json package-lock.json* /workspaces/lab_template/
RUN npm install

FROM mcr.microsoft.com/vscode/devcontainers/base:bullseye
COPY --from=builder /opt/rye /opt/rye
COPY --from=builder /workspaces/lab_template /workspaces/lab_template

ENV RYE_HOME="/opt/rye"
ENV PATH="$RYE_HOME/shims:$PATH"
ENV PYTHONUNBUFFERED True

RUN rye config --set-bool behavior.global-python=true && \
    rye config --set-bool behavior.use-uv=true

RUN chown -R vscode $RYE_HOME
