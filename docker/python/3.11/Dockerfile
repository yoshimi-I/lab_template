FROM python:3.11-slim

ENV PYTHON_VERSION=3.11

WORKDIR /workspaces/lab_template

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


RUN poetry config virtualenvs.create false \
    && poetry lock --no-update \
    && poetry install --no-interaction --no-ansi

# npm czを使いたいのでnodeを入れる
RUN apt-get update \
    && apt-get install nodejs -y \
    && apt-get install npm -y \
    && update-alternatives --install /usr/bin/node node /usr/bin/nodejs 10

COPY package.json package-lock.json* /workspaces/lab_template/

RUN npm install


COPY . /workspaces/lab_template
