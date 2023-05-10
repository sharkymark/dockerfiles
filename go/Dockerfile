#
# 2023-05-10 pushed to marktmilligan/go:1.20.4
# 2023-02-16 pushed to marktmilligan/go:1.20.1
# https://go.dev/dl/
# https://go.dev/doc/devel/release
#

# dockerfile
FROM codercom/enterprise-base:ubuntu

# run everything as root
USER root

# install go 1.20.4
RUN curl -L "https://dl.google.com/go/go1.20.4.linux-amd64.tar.gz" | tar -C /usr/local -xzvf -

# Setup go env vars
ENV GOROOT /usr/local/go
ENV PATH $PATH:$GOROOT/bin

ENV GOPATH /home/coder/go
ENV GOBIN $GOPATH/bin
ENV PATH $PATH:$GOBIN

# Set back to coder user
USER coder