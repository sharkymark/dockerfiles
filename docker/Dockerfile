FROM python:3.11-slim

RUN DEBIAN_FRONTEND="noninteractive" apt-get update -y && \
    apt-get install -y \
    curl \
    wget \
    netcat-traditional \
    net-tools \
    procps \
    ssh \
    git \
    htop \
    build-essential \
    nodejs \
    npm \
    pipx \
    sudo \
    docker.io && \
    rm -rf /var/lib/apt/lists/*

# Install devcontainer CLI
RUN npm install -g @devcontainers/cli

# Create the docker group with colima group id and non-root user
# Set this to match the GID of docker group on host/Colima
ARG DOCKER_GID=995

# Change docker group GID if necessary, or create it if missing
RUN if getent group docker ; then \
      groupmod -g $DOCKER_GID docker; \
    else \
      groupadd -g $DOCKER_GID docker; \
    fi && \
    useradd coder \
      --create-home \
      --shell=/bin/bash \
      --groups=sudo,docker \
      --uid=1000 \
      --user-group && \
    echo "coder ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/nopasswd

USER coder
WORKDIR /home/coder