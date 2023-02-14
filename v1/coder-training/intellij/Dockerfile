# 
# Pushed to DockerHub 2023-02-13 as marktmilligan/v1-intellij-ultimate-gateway:latest
#

# JDK 11
FROM codercom/enterprise-java:ubuntu

# Run everything as root
USER root

# Install IntelliJ IDEA Ultimate for access by JetBrains Gateway
RUN mkdir -p /opt/idea
RUN curl -L "https://download.jetbrains.com/product?code=IU&latest&distribution=linux" | tar -C /opt/idea --strip-components 1 -xzvf -

# configure script to create symbolic link from $HOME to /opt/idea so Gateway uses the image IDE
COPY ["configure", "/coder/configure"]
RUN chmod +x /coder/configure

# Set back to coder user
USER coder