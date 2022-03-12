FROM marktmilligan/intellij-ultimate:latest

# Run everything as root
USER root

# bash .profile so projector can be added to the path
COPY [".profile", "/coder/.profile"]

# configure script
COPY ["configure", "/coder/configure"]
RUN chmod +x /coder/configure

# copy custom apps info (config.yaml)
COPY ["./coder", "/coder"]

# Set back to coder user
USER coder

