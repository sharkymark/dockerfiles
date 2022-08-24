FROM querybook/querybook:latest

# Run everything as root
USER root

# configure script
COPY ["configure", "/coder/configure"]
RUN chmod +x /coder/configure

# copy custom apps info (config.yaml)
COPY ["./coder", "/coder"]

# Set back to coder user
USER coder