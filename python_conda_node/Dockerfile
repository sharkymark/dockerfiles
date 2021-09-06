# GitHub Codespaces conda image
FROM mcr.microsoft.com/vscode/devcontainers/anaconda:0-3 AS conda  

# Run everything as root
USER root

# Add the new configure script for installing VS Code extensions and pip install Python packages
COPY configure /coder/configure

# Set back to coder user
USER coder




