FROM marktmilligan/pycharm-pro:latest

# Run everything as root
USER root

# change name of configure script in the original image
RUN mv /coder/configure /coder/configure-first

# bash .profile so projector can be added to the path
COPY [".profile", "/coder/.profile"]

# configure script
COPY ["configure", "/coder/configure"]
RUN chmod +x /coder/configure

# copy custom apps info (config.yaml)
COPY ["./coder", "/coder"]

# Set back to coder user
USER coder

