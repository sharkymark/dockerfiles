FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

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
    libssl-dev \
    libyaml-dev \
    libreadline6-dev \
    zlib1g-dev \
    libncurses5-dev \
    libffi-dev \
    libgdbm-dev \
    sqlite3 \
    libsqlite3-dev \
    curl \
    wget \
    tzdata \
    nodejs \
    ca-certificates \
    openssl \
    # Packages required for multi-editor support
    libxtst6 \
    libxrender1 \
    libfontconfig1 \
    libxi6 \
    libgtk-3-0




# clone rbenv and ruby-build
RUN git clone https://github.com/rbenv/rbenv.git /usr/local/rbenv
RUN git clone https://github.com/rbenv/ruby-build.git /usr/local/rbenv/plugins/ruby-build
RUN /usr/local/rbenv/plugins/ruby-build/install.sh

ENV PATH /usr/local/rbenv/bin:/usr/local/rbenv/shims:$PATH

ENV RBENV_ROOT=/usr/local/rbenv

# install Ruby, bundler, Rails

RUN rbenv install 2.6.6
RUN rbenv install 2.7.0
RUN rbenv global 2.6.6
RUN rbenv rehash
RUN gem install bundler
RUN gem install rails -v 5.2.2


# Install RubyMine
RUN mkdir -p /opt/rubymine

# latest version
RUN curl -L "https://download.jetbrains.com/product?code=RM&latest&distribution=linux" | tar -C /opt/rubymine --strip-components 1 -xzvf -



# Add a binary to the PATH that points to the webstorm startup script
RUN ln -s /opt/rubymine/bin/rubymine.sh /usr/local/bin/rubymine

ENV PATH /usr/local/bin:$PATH


# Add a user `coder` so that you're not developing as the `root` user
RUN adduser --gecos '' --disabled-password coder && \
  echo "coder ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/nopasswd
USER coder



