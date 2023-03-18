#
# 2023-03-17 pushed to marktmilligan/code-server-fish:latest
#
# Dockerfile

FROM codercom/code-server:latest

# Run everything as root
USER root

# Install fish shell
RUN DEBIAN_FRONTEND="noninteractive" apt-get update -y \
    && apt-get install -y \
        fish

COPY ["configure", "/coder/configure"]
RUN chmod +x /coder/configure

# Copy config.fish 
COPY ["config.fish", "/coder/config.fish"]

# Set back to coder user
USER coder