FROM codercom/enterprise-base:ubuntu

USER root

# install wireguard vpn OSS
RUN apt-get update && \
    DEBIAN_FRONTEND="noninteractive" apt-get install -y \
    wireguard \
    net-tools \
    iproute2 \
    ufw \
    nano

# configure script
COPY ["configure", "/coder/configure"]
RUN chmod +x /coder/configure

# wireguard files
COPY ["private.key", "/etc/wireguard/private.key"]
COPY ["public.key", "/etc/wireguard/public.key"]
RUN chmod go= /etc/wireguard/private.key
COPY ["wg0.conf", "/etc/wireguard/wg0.conf"]

USER coder
