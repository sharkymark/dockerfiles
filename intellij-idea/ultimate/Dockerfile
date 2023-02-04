#
# 2023-02-04 pushed to marktmilligan/intellij-idea-ultimate:2022.3.2
# https://www.jetbrains.com/idea/download/
#

# Dockerfile
FROM codercom/enterprise-java:ubuntu

# Run everything as root
USER root

# Install IntelliJ Ultimate
RUN mkdir -p /opt/idea
RUN curl -L "https://download.jetbrains.com/product?code=IU&latest&distribution=linux" | tar -C /opt/idea --strip-components 1 -xzvf -

# In the container, run the script to symlink JetBrains Gateway IDE directory to image-installed IDE directory
# More info: https://www.jetbrains.com/help/idea/remote-development-troubleshooting.html#setup
# cd /opt/idea/bin && ./remote-dev-server.sh registerBackendLocationForGateway

# Set back to coder user
USER coder