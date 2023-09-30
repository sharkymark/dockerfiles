#
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

# Install eclipse
RUN wget "https://www.eclipse.org/downloads/download.php?file=/eclipse/downloads/drops4/R-4.27-202303020300/eclipse-SDK-4.27-linux-gtk-x86_64.tar.gz&mirror_id=1294&r=1" -O /tmp/eclipse.tar.gz && \
tar -xf /tmp/eclipse.tar.gz -C /opt --no-same-owner && \
rm /tmp/eclipse.tar.gz

# Set back to coder user
USER coder