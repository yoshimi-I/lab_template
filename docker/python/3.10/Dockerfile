FROM python:3.10-slim

ENV PYTHON_VERSION=3.10

WORKDIR /workspaces/DataLab_Python

RUN pip install poetry

# 既存のファイルを削除
RUN if [ -f /workspaces/DataLab_Python/pyproject.toml ]; then rm /workspaces/DataLab_Python/pyproject.toml; fi && \
    if [ -f /workspaces/DataLab_Python/poetry.lock ]; then rm /workspaces/DataLab_Python/poetry.lock; fi

# 新しいファイルをコピー
COPY ./docker/python/${PYTHON_VERSION}/pyproject.toml ./docker/python/${PYTHON_VERSION}/poetry.lock* /workspaces/DataLab_Python/


RUN poetry config virtualenvs.create false \
    && poetry lock --no-update \
    && poetry install --no-interaction --no-ansi

# npm czを使いたいのでnodeを入れる
RUN apt-get update \
    && apt-get install nodejs -y \
    && apt-get install npm -y \
    && update-alternatives --install /usr/bin/node node /usr/bin/nodejs 10

COPY package.json package-lock.json* /workspaces/DataLab_Python/

RUN npm install


COPY . /workspaces/DataLab_Python
