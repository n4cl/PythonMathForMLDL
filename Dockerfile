FROM python:3.12-slim-bookworm

ENV TZ=Asia/Tokyo

RUN apt-get update && apt-get install -y \
    tzdata \
    gcc \
    g++ \
    git \
&&  ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
&&  apt-get clean \
&&  rm -rf /var/lib/apt/lists/*

COPY Pipfile Pipfile.lock /app/
WORKDIR /app
RUN pip install --upgrade pip && pip install pipenv && pipenv install --system
