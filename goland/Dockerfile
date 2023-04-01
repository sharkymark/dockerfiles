#
# 2023-02-04 pushed to marktmilligan/goland:2022.3.2
# 2023-04-01 pushed to marktmilligan/goland:2022.3.4
# https://download.jetbrains.com/go/goland-2022.3.4.tar.gz
# https://www.jetbrains.com/goland/download/
# https://data.services.jetbrains.com/products/releases?code=Go
# https://go.dev/dl/
#

# dockerfile
FROM codercom/enterprise-base:ubuntu

# run everything as root
USER root

# install go1.20
RUN curl -L "https://dl.google.com/go/go1.20.linux-amd64.tar.gz" | tar -C /usr/local -xzvf -

# Setup go env vars
ENV GOROOT /usr/local/go
ENV PATH $PATH:$GOROOT/bin

ENV GOPATH /home/coder/go
ENV GOBIN $GOPATH/bin
ENV PATH $PATH:$GOBIN

# Install jetbrains goland
RUN mkdir -p /opt/goland

RUN curl -L "https://download.jetbrains.com/go/goland-2022.3.4.tar.gz" | tar -C /opt/goland --strip-components 1 -xzvf -

#RUN curl -L "https://download.jetbrains.com/product?code=GO&latest&distribution=linux" | tar -C /opt/goland --strip-components 1 -xzvf -

# In the container, run the script to symlink JetBrains Gateway IDE directory to image-installed IDE directory
# More info: https://www.jetbrains.com/help/idea/remote-development-troubleshooting.html#setup
# cd /opt/goland/bin && ./remote-dev-server.sh registerBackendLocationForGateway

# Set back to coder user
USER coder