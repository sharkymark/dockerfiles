FROM kasmweb/desktop:1.12.0

USER root

COPY kasmvnc.yaml /etc/kasmvnc/kasmvnc.yaml
COPY vnc_startup.sh /dockerstartup/vnc_startup.sh
RUN cp -r /home/kasm-user /tmp/kasm-user
RUN apt-get update && apt-get install sudo
RUN echo "kasm-user ALL=(ALL) NOPASSWD:ALL" >>/etc/sudoers.d/nopasswd
RUN DEBIAN_FRONTEND=noninteractive make-ssl-cert generate-default-snakeoil --force-overwrite
RUN adduser kasm-user ssl-cert

# Install Insomnia
RUN wget -O wget -O /tmp/insomnia.deb https://github.com/Kong/insomnia/releases/download/core%402022.7.5/Insomnia.Core-2022.7.5.deb && \
    dpkg -i /tmp/insomnia.deb && \
    rm /tmp/insomnia.deb

USER 1000