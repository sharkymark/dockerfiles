FROM codercom/enterprise-multieditor:ubuntu

# Run everything as root
USER root

# Install go1.15
RUN curl -L "https://dl.google.com/go/go1.16.4.linux-amd64.tar.gz" | tar -C /usr/local -xzvf -

# Setup go env vars
ENV GOROOT /usr/local/go
ENV PATH $PATH:$GOROOT/bin

ENV GOPATH /home/coder/go
ENV GOBIN $GOPATH/bin
ENV PATH $PATH:$GOBIN

# Install goland.
RUN mkdir -p /opt/goland
RUN curl -L "https://download.jetbrains.com/product?code=GO&latest&distribution=linux" | tar -C /opt/goland --strip-components 1 -xzvf -

# Add a binary to the PATH that points to the goland startup script.
RUN ln -s /opt/goland/bin/goland.sh /usr/bin/goland

# Set back to coder user
USER coder