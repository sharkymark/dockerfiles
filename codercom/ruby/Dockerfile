# 3/20/21 update to add JetBrains support

FROM codercom/enterprise-base:ubuntu

# Run everything as root
USER root

RUN apt-get update && apt-get install -y \
    git \
    bash \
    curl \
    sudo \
    snapd \
    ssh \
    autoconf \
    bison \
    build-essential \
    libyaml-dev \
    libreadline6-dev \
    zlib1g-dev \
    libncurses5-dev \
    libffi-dev \
    libgdbm-dev \
    libssl-dev \
    sqlite3 \
    libsqlite3-dev \
    curl \
    wget \
    tzdata \
    nodejs \
    ca-certificates \
    openssl \
    libmysqlclient-dev \
    # for GUID creation in some Rails apps 
    net-tools

# Install Ruby from source
COPY ./install-ruby.sh /tmp
RUN chmod +x /tmp/install-ruby.sh && /tmp/install-ruby.sh

RUN gem install bundler

# Set back to coder user
USER coder