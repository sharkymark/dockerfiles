# the base image including git, curl, sudo
FROM codercom/enterprise-base:ubuntu

# Run everything as root
USER root

# Packages required for JetBrains projector (web browser) support
RUN apt-get update && \
    DEBIAN_FRONTEND="noninteractive" apt-get install -y \
    libxtst6 \
    libxrender1 \
    libfontconfig1 \
    libxi6 \
    libgtk-3-0

# Install php interpreter and CGI

RUN apt-get update && \
    DEBIAN_FRONTEND="noninteractive" apt-get install --yes \
      php \
      php7.4-cgi \
      sqlite3 \
      libsqlite3-dev \
      php7.4-sqlite3 \
      php-xdebug \
      php-dev      

# Install PHP Storm.
RUN mkdir -p /opt/ps
RUN curl -L "https://download.jetbrains.com/product?code=PS&latest&distribution=linux" | tar -C /opt/ps --strip-components 1 -xzvf - && \
ln -s /opt/ps/bin/phpstorm.sh /usr/bin/phpstorm && \
cp /opt/ps/bin/idea.properties /opt/ps/bin/idea.properties.orig && \
chown coder:coder /opt/ps/bin/idea.properties

RUN mkdir -p /payload
ADD ./launch.json /payload

COPY xdebug.ini /etc/php/7.4/mods-available/

# download and install code-server (VS Code in a browser)
RUN curl -fsSL https://code-server.dev/install.sh | sh

# configure script (for installing VS Code extensions)
COPY ["configure", "/coder/configure"]
RUN chmod +x /coder/configure

# Set back to coder user
USER coder

RUN pip install projector-installer --user && \
mkdir -p ~/.projector/apps && \
ln -s /opt/ps ~/.projector/apps/ps && \
~/.local/bin/projector --accept-license config add PhpStorm ~/.projector/apps/ps --port 8997 --hostname=localhost --use-separate-config && \
sudo mv /opt/ps/bin/idea.properties.orig /opt/ps/bin/idea.properties && \
sudo mkdir -p /opt/projector /opt/.local && \
sudo chown -R coder:coder /opt/projector /opt/.local && \
cp -R ~/.projector/configs /opt/projector && \
cp -R ~/.local/bin /opt/.local && \
cp -R ~/.local/lib /opt/.local && \
rm -rf ~/.local ~/.projector ~/.cache