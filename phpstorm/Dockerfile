FROM codercom/enterprise-multieditor:ubuntu

# Run everything as root
USER root

# Install PHP
RUN apt-get update && \
    DEBIAN_FRONTEND="noninteractive" apt-get install --yes \
    php7.4 \
    php7.4-fpm \
    php7.4-mbstring \
    php7.4-bcmath \
    php7.4-xml \
    php7.4-xmlrpc \
    php7.4-zip \
    php7.4-sqlite3 \
    php7.4-mysql \
    php7.4-pgsql \
    php7.4-imap \
    php7.4-readline \
    php7.4-phpdbg \
    php7.4-curl \
    php7.4-dev \
    php7.4-pear \
    php7.4-ssh2 \
    php7.4-yaml \
    php7.4-memcached \
    php7.4-redis \
    php7.4-apcu \
    php7.4-xdebug \
    php7.4-xhprof \
    curl

# Install PHP Storm.
RUN mkdir -p /opt/ps
RUN curl -L "https://download.jetbrains.com/product?code=PS&latest&distribution=linux" | tar -C /opt/ps --strip-components 1 -xzvf -

# Add a binary to the PATH that points to the intellij startup script.
RUN ln -s /opt/ps/bin/phpstorm.sh /usr/bin/phpstorm

# Set back to coder user
USER coder