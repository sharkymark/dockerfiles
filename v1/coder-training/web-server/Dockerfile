# 
# Pushed to DockerHub 2023-02-13 as marktmilligan/v1-web-server:latest
#

# the parent image with python3
FROM codercom/enterprise-base:ubuntu

USER root

# configure script to create dev URL, copy index.html, and start Python web server
COPY ["configure", "/coder/configure"]
RUN chmod +x /coder/configure

# Copy index.html 
COPY ["index.html", "/coder/index.html"]

# set user back to coder and not root
USER coder