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
    net-tools \
    # Packages required for projector JetBrains support
    libxtst6 \
    libxrender1 \
    libfontconfig1 \
    libxi6 \
    libgtk-3-0

# Install Ruby from source
COPY ./install-ruby.sh /tmp
RUN chmod +x /tmp/install-ruby.sh && /tmp/install-ruby.sh

RUN gem install bundler

# Install RubyMine editor from JetBrains
RUN mkdir -p /opt/rubymine
ENV RUBYMINE_VERSION=2020.3.2   
RUN curl -L https://download.jetbrains.com/ruby/RubyMine-${RUBYMINE_VERSION}.tar.gz | tar -C /opt/rubymine --strip-components 1 -xzvf -
# Add a binary to the PATH that points to the JetBrains startup script
RUN ln -s /opt/rubymine/bin/rubymine.sh /usr/local/bin/rubymine
ENV PATH /usr/local/bin:$PATH

# Set back to coder user
USER coder