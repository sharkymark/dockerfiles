FROM codercom/enterprise-base:ubuntu

# concepts derived from:
# https://github.com/coder/enterprise-images/tree/main/images/vnc
# https://novnc.com/
# https://github.com/novnc/noVNC/releases
# https://github.com/novnc/websockify/releases
# https://www.turbovnc.org/
#
# 

# Run everything as root
USER root

# Add VNC
ARG DEBCONF_NONINTERACTIVE_SEEN=true
ARG DEBIAN_FRONTEND="noninteractive"

RUN echo 'tzdata tzdata/Areas select Etc' | debconf-set-selections; \
    echo 'tzdata tzdata/Zones/Etc select UTC' | debconf-set-selections

RUN apt-get install -y wget
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \ 
    && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list


RUN apt-get update && apt-get install -y \
  wget \
  unzip \
  zsh \
  supervisor \
  xorg \
  ssh \
  xfce4 \
  xfce4-goodies \
  x11-apps \
  xterm \
  python-numpy \
  google-chrome-stable \
  fonts-lyx \
  libxtst6 \
  libxv1 \
  libglu1-mesa \
  libegl1-mesa \
  libc6-dev \
  libglu1 \
  libsm6 \
  libxv1 \
  x11-xkb-utils \
  xauth \
  xfonts-base \
  xkb-data

# Install quality of life packages.
RUN yes | unminimize

# Remove packages which may not behave well in a VNC environment.
RUN apt-get remove -y \
  xfce4-battery-plugin \
  xfce4-power-manager-plugins \
  xfce4-pulseaudio-plugin \
  light-locker

RUN locale-gen en_US.UTF-8

ARG HOME=/home/coder
ARG VNC_ROOT_DIR=/opt/vnc

# download TurboVNC server

ARG TURBOVNC_VERSION=3.0.3
ARG VIRTUALGL_VERSION=3.1
ARG LIBJPEG_VERSION=3.0

RUN cd /tmp \
  && curl -fsSL -O https://netix.dl.sourceforge.net/project/turbovnc/${TURBOVNC_VERSION}/turbovnc_${TURBOVNC_VERSION}_amd64.deb \
    -O https://netix.dl.sourceforge.net/project/libjpeg-turbo/${LIBJPEG_VERSION}/libjpeg-turbo-official_${LIBJPEG_VERSION}_amd64.deb \
    -O https://netix.dl.sourceforge.net/project/virtualgl/${VIRTUALGL_VERSION}/virtualgl_${VIRTUALGL_VERSION}_amd64.deb \
    && dpkg -i *.deb \
    && rm -f /tmp/*.deb \
    && sed -i 's/$host:/unix:/g' /opt/TurboVNC/bin/vncserver

RUN ln -s /opt/TurboVNC/bin/* /opt/VirtualGL/bin/* /usr/local/bin/
# Configure VGL for use in a single user environment.
# This may trigger a warning about display managers needing to be restarted.
# This can be ignored as the VNC server manages this lifecycle.  
RUN vglserver_config -config +s +f +t

RUN echo 'no-remote-connections\n\
no-httpd\n\
no-x11-tcp-connections\n\
no-pam-sessions\n\
' > /etc/turbovncserver-security.conf

ENV VNC_SCRIPTS=$VNC_ROOT_DIR/scripts \
  VNC_SETUP_SCRIPTS=$VNC_ROOT_DIR/setup \
  VNC_LOG_DIR=$HOME/.vnc/log \
  VNC_XSTARTUP=$VNC_ROOT_DIR/xstartup \
  VNC_SUPERVISOR_CONFIG=$VNC_ROOT_DIR/supervisord.conf \
  VNC_PORT=5990 \
  VNC_DISPLAY_ID=:90 \
  VNC_COL_DEPTH=16 \
  VNC_RESOLUTION=1280x1024 \
  NO_VNC_HOME=$VNC_ROOT_DIR/noVNC \
  NO_VNC_PORT=6081 \
  XFCE_BASE_DIR=$VNC_ROOT_DIR/xfce4 \
  XFCE_DEST_DIR=$HOME/.config/xfce4

WORKDIR $HOME

ADD --chown=coder:coder ./xfce4 $XFCE_BASE_DIR
ADD --chown=coder:coder ./vnc $VNC_ROOT_DIR
ADD --chown=coder:coder ./supervisor /etc/supervisor

RUN find $VNC_SETUP_SCRIPTS -name '*.sh' -exec chmod a+x {} +

RUN $VNC_SETUP_SCRIPTS/set_user_permission.sh $VNC_ROOT_DIR \
  && chmod +x $VNC_XSTARTUP

COPY ["start_vnc", "/coder/start_vnc"]
RUN chmod +x /coder/start_vnc


# set back to coder user and no longer root
USER coder

# install noVNC and expose port 6081
RUN $VNC_SETUP_SCRIPTS/no_vnc.sh
EXPOSE $NO_VNC_PORT

#
# In a Coder template's `startup_script`, run `/coder/start_vnc` to start the TurboVNC server and noVNC
#