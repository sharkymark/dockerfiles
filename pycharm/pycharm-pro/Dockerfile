#
# 2023-02-04 pushed to marktmilligan/pycharm-pro:2022.3.2
# 2023-04-01 pushed to marktmilligan/pycharm-pro:2023.1
# 2023-05-12 pushed to marktmilligan/pycharm-pro:2023.1.1
# https://download.jetbrains.com/python/pycharm-professional-2023.1.tar.gz
# https://www.jetbrains.com/pycharm/download/
# https://data.services.jetbrains.com/products/releases?code=PY
#

# Dockerfile
FROM codercom/enterprise-base:ubuntu

# Run everything as root
USER root

# Install PyCharm Professional
RUN mkdir -p /opt/pycharm

RUN curl -L "https://download.jetbrains.com/python/pycharm-professional-2023.1.1.tar.gz" | tar -C /opt/pycharm --strip-components 1 -xzvf -

#RUN curl -L "https://download.jetbrains.com/product?code=PCP&latest&distribution=linux" | tar -C /opt/pycharm --strip-components 1 -xzvf -

# In the container, run the script to symlink JetBrains Gateway IDE directory to image-installed IDE directory
# More info: https://www.jetbrains.com/help/idea/remote-development-troubleshooting.html#setup
# cd /opt/pycharm/bin && ./remote-dev-server.sh registerBackendLocationForGateway

# Set back to coder user
USER coder