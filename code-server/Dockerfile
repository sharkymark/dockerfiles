FROM codercom/enterprise-multieditor:ubuntu

# Run everything as root
USER root

# Install code-server
ARG VERSION=4.0.2
ARG ARCH=amd64
RUN curl -L "https://github.com/cdr/code-server/releases/download/v$VERSION/code-server_${VERSION}_$ARCH.deb" -o \
    "/tmp/code-server_${VERSION}_$ARCH.deb" && \
    dpkg -i "/tmp/code-server_${VERSION}_$ARCH.deb" && \
    rm "/tmp/code-server_${VERSION}_$ARCH.deb"

# copy configure script to coder folder in container
COPY [ "configure", "/coder/configure" ]

# Set back to coder user
USER coder