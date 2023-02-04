# Dockerfile
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

# Install IntelliJ IDEA Community.
RUN mkdir -p /opt/idea
RUN curl -L "https://download.jetbrains.com/product?code=IC&latest&distribution=linux" | tar -C /opt/idea --strip-components 1 -xzvf -

# change owner to coder so projector CLI can create a config
RUN chown -R coder:coder /opt

# Set back to coder user
USER coder