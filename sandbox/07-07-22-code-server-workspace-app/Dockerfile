FROM codercom/enterprise-base:ubuntu

USER root 

RUN mkdir -p /coder/apps

# Install code-server
ARG VERSION=4.3.0
ARG ARCH=amd64
RUN curl -L "https://github.com/cdr/code-server/releases/download/v$VERSION/code-server_${VERSION}_$ARCH.deb" -o \
    "/tmp/code-server_${VERSION}_$ARCH.deb" && \
    dpkg -i "/tmp/code-server_${VERSION}_$ARCH.deb" && \
    rm "/tmp/code-server_${VERSION}_$ARCH.deb"


COPY config.yaml  /coder/apps/config.yaml
COPY code-server-icon.png  /coder/apps/code-server-icon.png

USER coder
WORKDIR /home/coder