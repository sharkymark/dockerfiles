FROM codercom/enterprise-base:ubuntu

# Run everything as root
USER root

# Packages required for multi-editor support
RUN apt-get update && \
    DEBIAN_FRONTEND="noninteractive" apt-get install -y \
    libxtst6 \
    libxrender1 \
    libfontconfig1 \
    libxi6 \
    libgtk-3-0

# Install JetBrains CLion.
RUN mkdir -p /opt/clion
RUN curl -L "https://download.jetbrains.com/product?code=CL&latest&distribution=linux" | tar -C /opt/clion --strip-components 1 -xzvf -

# Add a binary to the PATH that points to the clion startup script.
RUN ln -s /opt/clion/bin/clion.sh /usr/bin/clion

# add rust programming language
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# add code-server (VS Code in a browser)
RUN curl -fsSL https://code-server.dev/install.sh | sh

# configure script
COPY ["configure", "/coder/configure"]
RUN chmod +x /coder/configure

# change owner to coder so projector CLI can create a config
RUN chown -R coder:coder /opt

# Set back to coder user
USER coder

# Add Rust to path
ENV PATH /home/coder/.cargo/bin:${PATH}

# dockerhub image docker.io/marktmilligan/clion-rust:latest