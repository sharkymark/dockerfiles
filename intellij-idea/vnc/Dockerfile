#
# 2023-08-27 pushed to marktmilligan/intellij-idea-community-vnc:2022.3.2
# 2023-08-27 pushed marktmilligan/intellij-idea-community-vnc:2023.2.1
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
RUN curl -L "https://download.jetbrains.com/idea/ideaIC-2023.2.1.tar.gz" | tar -C /opt/idea --strip-components 1 -xzvf -

# Set back to coder user
USER coder