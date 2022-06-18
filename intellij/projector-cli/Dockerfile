FROM codercom/enterprise-base:ubuntu

# Run everything as root
USER root

# bash .profile so projector can be added to the path
ENV PATH="/home/coder/.local/bin:${PATH}"

# configure script
COPY ["configure", "/coder/configure"]
RUN chmod +x /coder/configure

# Set back to coder user
USER coder

