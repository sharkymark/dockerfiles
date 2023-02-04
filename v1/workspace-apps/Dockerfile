FROM codercom/enterprise-node:ubuntu

# Run everything as root
USER root

# configure script
COPY ["configure", "/coder/configure"]
RUN chmod +x /coder/configure

# copy custom apps info (config.yaml)
COPY ["./coder", "/coder"]

# install NPM node http server
RUN echo n | npm install -g --silent http-server

# Set back to coder user
USER coder

