# https://hub.docker.com/_/python

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
    wget \
    pipx \
    sudo \
    screen

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install GitHub CLI
RUN ARCH=$(dpkg --print-architecture) && \
    GH_VERSION=$(curl -s https://api.github.com/repos/cli/cli/releases/latest | grep tag_name | cut -d '"' -f 4 | cut -c 2-) && \
    curl -sSL "https://github.com/cli/cli/releases/latest/download/gh_${GH_VERSION}_linux_${ARCH}.deb" -o gh.deb && \
    dpkg -i gh.deb && \
    rm gh.deb

RUN useradd coder \
    --create-home \
    --shell=/bin/bash \
    --uid=1000 \
    --user-group && \
    echo "coder ALL=(ALL) NOPASSWD:ALL" >>/etc/sudoers.d/nopasswd
USER coder