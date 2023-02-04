#
# 2023-02-04 pushed to marktmilligan/intellij-idea-community
#

# Dockerfile
FROM codercom/enterprise-java:ubuntu

# Run everything as root
USER root

# Install code-server
RUN curl -fsSL https://code-server.dev/install.sh | sh

# Install IntelliJ IDEA Community
RUN mkdir -p /opt/idea
RUN curl -L "https://download.jetbrains.com/product?code=IC&latest&distribution=linux" | tar -C /opt/idea --strip-components 1 -xzvf -

# Set back to coder user
USER coder