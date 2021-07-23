FROM codercom/enterprise-multieditor:ubuntu

# Run everything as root
USER root

# Go and Goland
# Install go1.15
RUN curl -L "https://dl.google.com/go/go1.16.4.linux-amd64.tar.gz" | tar -C /usr/local -xzvf -

# Setup go env vars
ENV GOROOT /usr/local/go
ENV PATH $PATH:$GOROOT/bin

ENV GOPATH /home/coder/go
ENV GOBIN $GOPATH/bin
ENV PATH $PATH:$GOBIN

# Install goland.
RUN mkdir -p /opt/goland
RUN curl -L "https://download.jetbrains.com/product?code=GO&latest&distribution=linux" | tar -C /opt/goland --strip-components 1 -xzvf -

# Add a binary to the PATH that points to the goland startup script.
RUN ln -s /opt/goland/bin/goland.sh /usr/bin/goland

# Java and IntelliJ
# Install JDK (OpenJDK 14)
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y openjdk-14-jdk
ENV JAVA_HOME /usr/lib/jvm/java-14-openjdk-amd64
ENV PATH $PATH:$JAVA_HOME/bin

# Install intellij.
RUN mkdir -p /opt/idea
RUN curl -L "https://download.jetbrains.com/product?code=IIU&latest&distribution=linux" | tar -C /opt/idea --strip-components 1 -xzvf -

# Python and PyCharm
# Add a binary to the PATH that points to the intellij startup script.
RUN ln -s /opt/idea/bin/idea.sh /usr/bin/intellij-idea-ultimate

# Install pycharm and Jupyter
RUN mkdir -p /opt/pycharm
RUN curl -L "https://download.jetbrains.com/product?code=PCP&latest&distribution=linux" | tar -C /opt/pycharm --strip-components 1 -xzvf -

# Add a binary to the PATH that points to the pycharm startup script.
RUN ln -s /opt/pycharm/bin/pycharm.sh /usr/bin/pycharm

# Install jupyter
RUN pip3 install jupyterlab

# Install NodeJS

# Install whichever Node version is LTS
RUN curl -sL https://deb.nodesource.com/setup_lts.x | bash -
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y nodejs

# Install Yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN DEBIAN_FRONTEND="noninteractive" apt-get update && apt-get install -y yarn

# PHPStorm
RUN mkdir -p /opt/phpstorm

RUN curl -L "https://download.jetbrains.com/product?code=PS&latest&distribution=linux" | tar -C /opt/phpstorm --strip-components 1 -xzvf -

# Add a binary to the PATH that points to the startup script.
RUN ln -s /opt/phpstorm/bin/phpstorm.sh /usr/bin/phpstorm
 
# WebStorm

RUN mkdir -p /opt/webstorm

RUN curl -L "https://download.jetbrains.com/product?code=WS&latest&distribution=linux" | tar -C /opt/webstorm --strip-components 1 -xzvf -

# Add a binary to the PATH that points to the startup script.
RUN ln -s /opt/webstorm/bin/webstorm.sh /usr/bin/webstorm

# install PHP and Apache 
RUN apt-get update && DEBIAN_FRONTEND="noninteractive" apt-get install --yes php libapache2-mod-php

# Ruby and Rubymine

# install OpenSSL and MySQL 
RUN apt-get update && DEBIAN_FRONTEND="noninteractive" apt-get install --yes \
    openssl \
    libssl-dev \
    sqlite3 \
    libsqlite3-dev \
    libmysqlclient-dev

# Install Ruby from source
COPY ./install-ruby.sh /tmp
RUN chmod +x /tmp/install-ruby.sh && /tmp/install-ruby.sh

RUN gem install bundler

RUN apt-get update && DEBIAN_FRONTEND="noninteractive" apt-get install --yes \
    net-tools

RUN mkdir -p /opt/rubymine
RUN curl -L "https://download.jetbrains.com/product?code=RM&latest&distribution=linux" | tar -C /opt/rubymine --strip-components 1 -xzvf -

# Add a binary to the PATH that points to the startup script.
RUN ln -s /opt/rubymine/bin/rubymine.sh /usr/bin/rubymine

# Clion
RUN mkdir -p /opt/clion
RUN curl -L "https://download.jetbrains.com/product?code=CL&latest&distribution=linux" | tar -C /opt/clion --strip-components 1 -xzvf -

# Add a binary to the PATH that points to the startup script.
RUN ln -s /opt/clion/bin/clion.sh /usr/bin/clion

# Rider
RUN mkdir -p /opt/rider
RUN curl -L "https://download.jetbrains.com/product?code=RD&latest&distribution=linux" | tar -C /opt/rider --strip-components 1 -xzvf -

# Add a binary to the PATH that points to the startup script.
RUN ln -s /opt/rider/bin/rider.sh /usr/bin/rider

# Set back to coder user
USER coder

# Add VNC
USER 0

ARG DEBCONF_NONINTERACTIVE_SEEN=true
ARG DEBIAN_FRONTEND="noninteractive"
ARG TURBOVNC_VERSION=2.2.5
ARG VIRTUALGL_VERSION=2.6.4
ARG LIBJPEG_VERSION=2.0.5

RUN echo 'tzdata tzdata/Areas select Etc' | debconf-set-selections; \
    echo 'tzdata tzdata/Zones/Etc select UTC' | debconf-set-selections

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
  firefox \
  fonts-lyx \
  libxtst6 \
  libxv1 \
  libglu1-mesa \
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
  VNC_COL_DEPTH=24 \
  VNC_RESOLUTION=3840x2160 \
  NO_VNC_HOME=$VNC_ROOT_DIR/noVNC \
  NO_VNC_PORT=6081 \
  XFCE_BASE_DIR=$VNC_ROOT_DIR/xfce4 \
  XFCE_DEST_DIR=$HOME/.config/xfce4

WORKDIR $HOME

# Enable better defaults for command tab completion.
RUN chsh -s $(readlink -f $(which zsh)) coder 

ADD --chown=coder:coder ./xfce4 $XFCE_BASE_DIR
ADD --chown=coder:coder ./vnc $VNC_ROOT_DIR
ADD --chown=coder:coder ./supervisor /etc/supervisor

RUN find $VNC_SETUP_SCRIPTS -name '*.sh' -exec chmod a+x {} +

RUN $VNC_SETUP_SCRIPTS/set_user_permission.sh $VNC_ROOT_DIR \
  && chmod +x $VNC_XSTARTUP

COPY ["configure", "/coder/configure"]
RUN chmod +x /coder/configure

USER coder

RUN $VNC_SETUP_SCRIPTS/no_vnc.sh

EXPOSE $NO_VNC_PORT