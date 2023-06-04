#
# 2023-06-04 pushed to marktmilligan/kitchen-sink:2023.06.04
#
# java, node.js, golang
#
#
# https://go.dev/dl/
# https://go.dev/doc/devel/release
#


# Dockerfile
FROM codercom/enterprise-java:ubuntu

# Run everything as root
USER root

# Node.js

# Install whichever Node version is LTS
RUN curl -sL https://deb.nodesource.com/setup_lts.x | bash -
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y nodejs

# Install Yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN DEBIAN_FRONTEND="noninteractive" apt-get update && apt-get install -y yarn

# Golang

# install go 1.20.4
RUN curl -L "https://dl.google.com/go/go1.20.3.linux-amd64.tar.gz" | tar -C /usr/local -xzvf -

# Setup go env vars
ENV GOROOT /usr/local/go
ENV PATH $PATH:$GOROOT/bin

ENV GOPATH /home/coder/go
ENV GOBIN $GOPATH/bin
ENV PATH $PATH:$GOBIN

# Set back to coder user
USER coder