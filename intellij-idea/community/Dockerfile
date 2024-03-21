#
# 2024-03-21 pushed to marktmilligan/intellij-idea-community
#

# Dockerfile
FROM marktmilligan/java:jdk-11

# Run everything as root
USER root

# Install IntelliJ IDEA Community
RUN mkdir -p /opt/idea
RUN curl -L "https://download.jetbrains.com/product?code=IC&latest&distribution=linux" | tar -C /opt/idea --strip-components 1 -xzvf -

# Set back to coder user
USER coder