FROM python:3.12-slim

ENV PYTHON_VERSION=3.12

WORKDIR /workspaces/lab_template

# 必要なパッケージのインストール
RUN apt-get update && apt-get install -y \
    gcc \
    python3-dev \
    nodejs \
    npm \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Poetryのインストール
RUN pip install poetry

# 既存のファイルを削除
RUN if [ -f /workspaces/lab_template/pyproject.toml ]; then rm /workspaces/lab_template/pyproject.toml; fi && \
    if [ -f /workspaces/lab_template/poetry.lock ]; then rm /workspaces/lab_template/poetry.lock; fi

# 新しいファイルをコピー
COPY ./docker/python/${PYTHON_VERSION}/pyproject.toml /workspaces/lab_template/docker/python/${PYTHON_VERSION}/pyproject.toml
COPY ./docker/python/${PYTHON_VERSION}/poetry.lock /workspaces/lab_template/docker/python/${PYTHON_VERSION}/poetry.lock

# シンボリックリンクの作成
RUN ln -s /workspaces/lab_template/docker/python/${PYTHON_VERSION}/pyproject.toml /workspaces/lab_template/pyproject.toml && \
    ln -s /workspaces/lab_template/docker/python/${PYTHON_VERSION}/poetry.lock /workspaces/lab_template/poetry.lock

# Poetryを使用して依存関係のインストール
RUN poetry config virtualenvs.create false \
    && poetry install --no-interaction --no-ansi --no-dev

# node.jsの設定
RUN update-alternatives --install /usr/bin/node node /usr/bin/nodejs 10

# npmパッケージのインストール
COPY package.json package-lock.json* /workspaces/lab_template/
RUN npm install

# アプリケーションファイルのコピー
COPY . /workspaces/lab_template
