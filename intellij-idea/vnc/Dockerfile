#
# 2023-02-09 pushed to marktmilligan/intellij-idea-community-vnc:2022.3.2
#

# Dockerfile
FROM codercom/enterprise-vnc:ubuntu

# Run everything as root
USER root

# Install code-server
RUN curl -fsSL https://code-server.dev/install.sh | sh

# Install IntelliJ IDEA Community
RUN mkdir -p /opt/idea
RUN curl -L "https://download.jetbrains.com/product?code=IC&latest&distribution=linux" | tar -C /opt/idea --strip-components 1 -xzvf -

# Install JDK (OpenJDK 8)
RUN DEBIAN_FRONTEND="noninteractive" apt-get update -y && \
    apt-get install -y openjdk-11-jdk
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64
ENV PATH $PATH:$JAVA_HOME/bin

# Set back to coder user
USER coder