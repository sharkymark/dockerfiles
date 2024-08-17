#
# 2024-08-16 pushed to marktmilligan/novnc-insomnia:latest
#  - TURBOVNC_VERSION=3.0.3 - VIRTUALGL_VERSION=3.1 - LIBJPEG_VERSION=3.0
#

# Dockerfile
FROM marktmilligan/vnc:coder-v2

# Run everything as root
USER root

# Install Insomnia

#RUN wget -O wget -O /tmp/insomnia.deb https://github.com/Kong/insomnia/releases/download/core%409.3.3/Insomnia.Core-9.3.3.deb && \
#    dpkg -i /tmp/insomnia.deb && \
#    rm /tmp/insomnia.deb

RUN curl -1sLf \
  'https://packages.konghq.com/public/insomnia/setup.deb.sh' \
  | sudo -E distro=ubuntu codename=focal bash

# Install Insomnia
RUN apt-get update && apt-get install -y insomnia

# Set back to coder user
USER coder