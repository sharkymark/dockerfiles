FROM codercom/enterprise-base:ubuntu

# Run everything as root
USER root

# Add additional tools

RUN apt-get update && \
    DEBIAN_FRONTEND="noninteractive" apt-get install --yes \
      snapd

# Set back to coder user
USER coder