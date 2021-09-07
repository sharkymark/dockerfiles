# GitHub Codespaces conda image
FROM mcr.microsoft.com/vscode/devcontainers/anaconda:0-3 AS conda  

# Run everything as root
USER root

# Add the new configure script for installing VS Code extensions and pip install Python packages
COPY configure /coder/configure

# Add a user `coder` so that you're not developing as the `root` user
RUN useradd coder \
      --create-home \
      --shell=/bin/bash \
      --uid=1001 \
      --user-group && \
    echo "coder ALL=(ALL) NOPASSWD:ALL" >>/etc/sudoers.d/nopasswd

# Set back to coder user
USER coder




