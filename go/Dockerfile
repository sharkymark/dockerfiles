#
# 2023-05-10 pushed to marktmilligan/go:1.20.4
# 2023-02-16 pushed to marktmilligan/go:1.20.1
# https://go.dev/dl/
# https://go.dev/doc/devel/release
#

# dockerfile
FROM codercom/enterprise-base:ubuntu

# run everything as root
USER root

# install go 1.20.4
RUN curl -L "https://dl.google.com/go/go1.21.0.linux-amd64.tar.gz" | tar -C /usr/local -xzvf -

# Setup go env vars
ENV GOROOT /usr/local/go
ENV PATH $PATH:$GOROOT/bin

ENV GOPATH /home/coder/go
ENV GOBIN $GOPATH/bin
ENV PATH $PATH:$GOBIN

# Install zsh
RUN apt install zsh -y

# Install fish
RUN apt install fish -y

# Microsoft Visual Studio Code required packages
RUN DEBIAN_FRONTEND="noninteractive" apt-get update -y && \
    apt-get install -y \
    libnss3 \
    libatk-bridge2.0-0 \
    libatk1.0-0 \
    libatspi2.0-0 \
    libcairo2 \
    libdrm2 \
    libgbm1 \
    libgtk-3-0 \
    libnspr4 \
    libpango-1.0-0 \
    libsecret-1-0 \
    libxcomposite1 \
    libxdamage1 \
    libxfixes3 \
    libxkbcommon0 \
    libxkbfile1 \
    libxrandr2 \
    xdg-utils

# Set back to coder user
USER coder