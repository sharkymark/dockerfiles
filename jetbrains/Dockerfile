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