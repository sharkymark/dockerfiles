#
# 2023-02-04 pushed to marktmilligan/intellij-idea-ultimate:2022.3.2
# https://download.jetbrains.com/idea/ideaIU-2022.1.4.tar.gz
# 2023-03-15 pushed to marktmilligan/intellij-idea-ultimate:2022.1.4
# 2023-04-01 pushed to marktmilligan/intellij-idea-ultimate:2023.1
# 2023-08-06 pushed to marktmilligan/intellij-idea-ultimate:2023.2
# https://download.jetbrains.com/idea/ideaIU-2023.2.tar.gz
# https://www.jetbrains.com/idea/download/
# https://data.services.jetbrains.com/products/releases?code=IU
#

# Dockerfile
FROM codercom/enterprise-java:ubuntu

# Run everything as root
USER root

# Install IntelliJ Ultimate
RUN mkdir -p /opt/idea
RUN curl -L "https://download.jetbrains.com/idea/ideaIU-2023.2.2.tar.gz" | tar -C /opt/idea --strip-components 1 -xzvf -

# In the container, run the script to symlink JetBrains Gateway IDE directory to image-installed IDE directory
# More info: https://www.jetbrains.com/help/idea/remote-development-troubleshooting.html#setup
# cd /opt/idea/bin && ./remote-dev-server.sh registerBackendLocationForGateway

# Set back to coder user
USER coder