# Dockerfile
#
# Built and uploaded to docker.io/marktmilligan/phpstorm-vscode:2022.1.4 on 2023-03-22
#
#
FROM codercom/enterprise-base:ubuntu

# Run everything as root
USER root

# Packages required to install PHP interpreter, debugger, and sqlite3
RUN apt-get update && \
    DEBIAN_FRONTEND="noninteractive" apt-get install --yes \
      php \
      php7.4-cgi \
      sqlite3 \
      libsqlite3-dev \
      php7.4-sqlite3 \
      php-xdebug \
      php-dev   

# Install code-server
RUN curl -fsSL https://code-server.dev/install.sh | sh

# Install phpstorm
RUN mkdir -p /opt/ps
#RUN curl -L "https://download.jetbrains.com/product?code=PS&latest&distribution=linux" | tar -C /opt/ps --strip-components 1 -xzvf -

RUN curl -L "https://download.jetbrains.com/webide/PhpStorm-2022.1.4.tar.gz" | tar -C /opt/ps --strip-components 1 -xzvf -

# packages required for jetbrains projector support
RUN DEBIAN_FRONTEND="noninteractive" apt-get update -y \
    && apt-get install -y \
        libxtst6 \
        libxrender1 \
        libfontconfig1 \
        libxi6 \
        libgtk-3-0

# Add a binary to the PATH that points to the phpstorm startup script.
RUN ln -s /opt/ps/bin/phpstorm.sh /usr/bin/phpstorm

RUN mkdir -p /payload
ADD ./launch.json /payload

COPY xdebug.ini /etc/php/7.4/mods-available/

# change owner to coder so projector CLI can create a config
RUN chown -R coder:coder /opt

# Set back to coder user
USER coder