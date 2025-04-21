FROM python:3.13-slim

RUN DEBIAN_FRONTEND="noninteractive" apt-get update -y && \
    apt-get install -y \
    curl \
    netcat-traditional \
    procps \
    ssh \
    git \
    net-tools \
    htop \
    build-essential \
    nodejs \
    npm \
    sudo \
    wget

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Goose CLI (non-interactive)
RUN curl -fsSL https://github.com/block/goose/releases/download/stable/download_cli.sh | CONFIGURE=false bash

# Install Aider
RUN curl -LsSf https://aider.chat/install.sh | sh

ENV PATH="/root/.local/bin:$PATH"