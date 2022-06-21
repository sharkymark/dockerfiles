FROM codercom/enterprise-base:ubuntu

# Run everything as root
USER root

# bash .profile so projector can be added to the path
ENV PATH="/home/coder/.local/bin:${PATH}"

# Packages required for JetBrains projector support
RUN DEBIAN_FRONTEND="noninteractive" apt-get update -y && \
    apt-get install -y \
    libxtst6 \
    libxrender1 \
    libfontconfig1 \
    libxi6 \
    libgtk-3-0

# Install intelliJ
RUN mkdir -p /opt/idea
RUN curl -L "https://download.jetbrains.com/product?code=IIC&latest&distribution=linux" | tar -C /opt/idea --strip-components 1 -xzvf -

# Add a binary to the PATH that points to the intellij startup script.
RUN ln -s /opt/idea/bin/idea.sh /usr/bin/intellij-idea-community

# configure script
COPY ["configure", "/coder/configure"]
RUN chmod +x /coder/configure

# Set back to coder user
USER coder

