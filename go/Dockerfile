#
# 2025-02-11 marktmilligan/go:1.24.0
# 2024-08-30 martkmilligan/go:1.23.0
# 2024-03-15 marktmilligan/go:1.22.1
# 2023-12-23 pushed to marktmilligan/go.1.21.5 with
# 2023-11-22 pushed to marktmilligan/go.1.21.4
# 2023-09-15 pushed to marktmilligan/go.1.21.0
# 2023-05-10 pushed to marktmilligan/go:1.20.4
# 2023-02-16 pushed to marktmilligan/go:1.20.1
# https://go.dev/dl/
# https://go.dev/doc/devel/release
#

# dockerfile
FROM codercom/enterprise-base:ubuntu

# run everything as root
USER root

# install go
RUN curl -L "https://dl.google.com/go/go1.24.0.linux-amd64.tar.gz" | tar -C /usr/local -xzvf -

# Setup go env vars
ENV GOROOT /usr/local/go
ENV PATH $PATH:$GOROOT/bin

ENV GOPATH /home/coder/go
ENV GOBIN $GOPATH/bin
ENV PATH $PATH:$GOBIN

RUN apt update -y

# install zsh
RUN apt install zsh -y

# install fish
RUN apt install fish -y

# Set back to coder user
USER coder