#
# 2025-04-20 marktmilligan/jupyter:latest
# 2024-08-05 marktmilligan/jupyter:latest
#
# https://jupyter.org/install
# https://github.com/jupyterlab/jupyterlab/releases
# https://pandas.pydata.org/
# https://github.com/coder/enterprise-images/tree/main/images/base
#

# dockerfile
FROM python:3.13-slim

RUN DEBIAN_FRONTEND="noninteractive" apt-get update -y && \
    apt-get install -y \
    curl \
    netcat-traditional \
    procps \
    ssh \
    git \
    net-tools \
    wget \
    htop \
    sudo \
    build-essential

# install jupyter and pandas
RUN pip3 install jupyterlab && \
    pip3 install jupyter-core && \
    pip3 install notebook && \
    pip3 install pandas && \
    pip3 install prettytable

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

ARG CACHEBUST=1
RUN curl -fsSL https://code-server.dev/install.sh | sh -s -- --method=standalone --prefix=/tmp/code-server \
&& rm -rf /tmp/code-server/install.sh

RUN useradd -m -s /bin/bash coder && \
    usermod -aG sudo coder && \
    echo "coder ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/coder && \
    chmod 0440 /etc/sudoers.d/coder
USER coder