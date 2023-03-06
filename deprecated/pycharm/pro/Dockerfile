# Dockerfile
#
# JetBrains IntelliJ PyCharm Professional
# 2023-03-06 build and push to DockerHub
# marktmilligan/pp-chown:latest (projector does not work)
# marktmilligan/pp-chown:2022.1.4
# marktmilligan/pp-chown:2021.3.3
#
# https://data.services.jetbrains.com/products/releases?code=PCP
#
FROM codercom/enterprise-java:ubuntu

# Run everything as root
USER root

# Packages required for multi-editor support
RUN DEBIAN_FRONTEND="noninteractive" apt-get update -y \
    && apt-get install -y \
        libxtst6 \
        libxrender1 \
        libfontconfig1 \
        libxi6 \
        libgtk-3-0

# Install code-server
RUN curl -fsSL https://code-server.dev/install.sh | sh

# Install IntelliJ PyCharm Professional
RUN mkdir -p /opt/pycharm
RUN curl -L "https://download.jetbrains.com/python/pycharm-professional-2022.1.4.tar.gz" | tar -C /opt/pycharm --strip-components 1 -xzvf -

# change owner to coder so projector CLI can create a config
RUN chown -R coder:coder /opt

# Set back to coder user
USER coder