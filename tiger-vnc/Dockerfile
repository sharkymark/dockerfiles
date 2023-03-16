# 
# Pushed to DockerHub 2023-03-12 as marktmilligan/tigervnc:latest
#
# https://serverfault.com/questions/376302/tigervnc-ssh-without-a-vnc-password
#

# the base image 
FROM codercom/enterprise-base:ubuntu

USER root

# Install baseline packages
RUN apt-get update && \
    DEBIAN_FRONTEND="noninteractive" apt-get install --yes \
    xfce4 \
    xfce4-goodies \
    xfce4-terminal \
    xfce4-screensaver \
    firefox \
    tigervnc-standalone-server \
    supervisor

RUN update-alternatives --config x-terminal-emulator

# configure script to start supervisord
COPY ["configure", "/coder/configure"]
RUN chmod +x /coder/configure

# copy supervisord config
RUN mkdir -p /var/log/supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

COPY xstartup /coder/xstartup

# set user back to coder and not root
USER coder