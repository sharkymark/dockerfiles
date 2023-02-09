#
# 2023-02-04 pushed to marktmilligan/rubymine:2022.3.2
# https://www.jetbrains.com/ruby/download/
#

# Dockerfile
FROM codercom/enterprise-base:ubuntu

# Run everything as root
USER root

# Install PyCharm Professional
RUN mkdir -p /opt/pycharm
RUN curl -L "https://download.jetbrains.com/product?code=PCP&latest&distribution=linux" | tar -C /opt/pycharm --strip-components 1 -xzvf -

# In the container, run the script to symlink JetBrains Gateway IDE directory to image-installed IDE directory
# More info: https://www.jetbrains.com/help/idea/remote-development-troubleshooting.html#setup
# cd /opt/pycharm/bin && ./remote-dev-server.sh registerBackendLocationForGateway

# Set back to coder user
USER coder