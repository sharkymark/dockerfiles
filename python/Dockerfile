FROM python:3.13-slim

RUN DEBIAN_FRONTEND="noninteractive" apt-get update -y && \
    apt-get install -y \
    curl \
    netcat-traditional \
    procps \
    ssh \
    git \
    net-tools \
    htop build-essential \
    nodejs \
    npm \
    screen

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN useradd -m -s /bin/bash coder
USER coder