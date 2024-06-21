#
# 2024-06-21 pushed to marktmilligan/intellij-idea-community-vnc:2024.1.4
# 2024-03-21 pushed to marktmilligan/intellij-idea-community-vnc:2023.3.5
# 2023-09-23 pushed to marktmilligan/intellij-idea-community-vnc:2023.2.2
# https://data.services.jetbrains.com/products/releases?code=IC
#

# Dockerfile
FROM marktmilligan/vnc:coder-v2

# Run everything as root
USER root

# Install JDK 11
RUN DEBIAN_FRONTEND="noninteractive" apt-get update -y && \
    apt-get install -y openjdk-11-jdk
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64
ENV PATH $PATH:$JAVA_HOME/bin

# Install IntelliJ IDEA Community
RUN mkdir -p /opt/idea
RUN curl -L "https://download.jetbrains.com/idea/ideaIC-2024.1.4.tar.gz" | tar -C /opt/idea --strip-components 1 -xzvf -

# Set back to coder user
USER coder