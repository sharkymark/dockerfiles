#
# 2023-02-04 pushed to marktmilligan/webstorm:2022.3.2
# https://www.jetbrains.com/webstorm/download/
#

# Dockerfile
FROM codercom/enterprise-base:ubuntu

# Run everything as root
USER root

# Install whichever Node version is LTS
RUN curl -sL https://deb.nodesource.com/setup_lts.x | bash -
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y nodejs

# Install Yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN DEBIAN_FRONTEND="noninteractive" apt-get update && apt-get install -y yarn

# Install WebStorm
RUN mkdir -p /opt/webstorm
RUN curl -L "https://download.jetbrains.com/product?code=WS&latest&distribution=linux" | tar -C /opt/webstorm --strip-components 1 -xzvf -

# In the container, run the script to symlink JetBrains Gateway IDE directory to image-installed IDE directory
# More info: https://www.jetbrains.com/help/idea/remote-development-troubleshooting.html#setup
# cd /opt/webstorm/bin && ./remote-dev-server.sh registerBackendLocationForGateway

# Set back to coder user
USER coder