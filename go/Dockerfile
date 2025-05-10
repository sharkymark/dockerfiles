#
# 2025-04-09 marktmilligan/go:1.24.0
# 2024-08-30 martkmilligan/go:1.23.0
# 2024-03-15 marktmilligan/go:1.22.1
# 2023-12-23 pushed to marktmilligan/go.1.21.5 with
# 2023-11-22 pushed to marktmilligan/go.1.21.4
# 2023-09-15 pushed to marktmilligan/go.1.21.0
# 2023-05-10 pushed to marktmilligan/go:1.20.4
# 2023-02-16 pushed to marktmilligan/go:1.20.1
# https://go.dev/dl/
# https://go.dev/doc/devel/release
#

# dockerfile
FROM codercom/enterprise-base:ubuntu

ARG GO_RELEASE="1.24.0"

# run everything as root
USER root

# install go
RUN ARCH=$(uname -m) && \
    case "$ARCH" in \
        x86_64) GO_ARCH="amd64" ;; \
        aarch64) GO_ARCH="arm64" ;; \
        arm*) GO_ARCH="armv6l" ;; \
        *) echo "Unsupported architecture: $ARCH"; exit 1 ;; \
    esac && \
    curl -L "https://dl.google.com/go/go${GO_RELEASE}.linux-${GO_ARCH}.tar.gz" | tar -C /usr/local -xzvf -

# Install GitHub CLI
RUN ARCH=$(dpkg --print-architecture) && \
    GH_VERSION=$(curl -s https://api.github.com/repos/cli/cli/releases/latest | grep tag_name | cut -d '"' -f 4 | cut -c 2-) && \
    curl -sSL "https://github.com/cli/cli/releases/latest/download/gh_${GH_VERSION}_linux_${ARCH}.deb" -o gh.deb && \
    dpkg -i gh.deb && \
    rm gh.deb

RUN DEBIAN_FRONTEND="noninteractive" apt-get update -y && \
    apt-get install -y \
    netcat-traditional \
    net-tools \
    procps \
    zsh \
    fish

# Set back to coder user
USER coder
WORKDIR /home/coder

# Setup go env vars
ENV GOROOT /usr/local/go
ENV PATH $PATH:$GOROOT/bin
ENV GOPATH /home/coder/go
ENV GOBIN $GOPATH/bin
ENV PATH $PATH:$GOBIN
