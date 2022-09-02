# Dockerfile

# JDK 11, Mvn, Gradle
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

# Install IntelliJ
RUN mkdir -p /opt/idea

RUN curl -L "https://download.jetbrains.com/product?code=IIC&latest&distribution=linux" | tar -C /opt/idea --strip-components 1 -xzvf -

#RUN curl -L "https://download.jetbrains.com/product?code=IIU&latest&distribution=linux" | tar -C /opt/idea --strip-components 1 -xzvf -

RUN chown -R coder:coder /opt

# Set back to coder user
USER coder