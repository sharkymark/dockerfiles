FROM codercom/enterprise-multieditor:ubuntu

# Run everything as root
USER root

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
RUN curl -L "https://download.jetbrains.com/product?code=PS&latest&distribution=linux" | tar -C /opt/ps --strip-components 1 -xzvf -

# Add a binary to the PATH that points to the intellij startup script.
RUN ln -s /opt/ps/bin/phpstorm.sh /usr/bin/phpstorm

RUN mkdir -p /payload
ADD ./launch.json /payload
ADD ./xdebug.ini /payload

# Add the new configure script
COPY configure /coder/configure

# Set back to coder user
USER coder