FROM codercom/enterprise-base:ubuntu

# Run everything as root
USER root

# Install IntelliJ IDEA Community
RUN mkdir -p /opt/idea
RUN curl -L "https://download.jetbrains.com/product?code=IC&2022.2.4&distribution=linux" | tar -C /opt/idea --strip-components 1 -xzvf -

# Packages required for Projector support
RUN DEBIAN_FRONTEND="noninteractive" apt-get update -y && \
    apt-get install -y \
    libxtst6 \
    libxrender1 \
    libfontconfig1 \
    libxi6 \
    libgtk-3-0

# configure script
COPY ["configure", "/coder/configure"]
RUN chmod +x /coder/configure

# copy workspace apps info (config.yaml)
COPY ["./coder", "/coder"]

# change owner to coder so projector CLI can create a config
RUN chown -R coder:coder /opt

# Set back to coder user
USER coder

