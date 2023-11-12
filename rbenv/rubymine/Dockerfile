# 2023-11-12 update to rubymine 2023.2.5 docker.io/marktmilligan/ruby-2-7-2:rm-2023.2.5
# 2022-2-26 update docker.io/marktmilligan/ruby-2-7-2:latest
# https://data.services.jetbrains.com/products/releases?code=RM

FROM codercom/enterprise-base:ubuntu

# Run everything as root
USER root

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    sqlite3 \
    libsqlite3-dev \
    curl \
    libssl-dev \
    libreadline-dev


# clone rbenv and ruby-build
RUN git clone https://github.com/rbenv/rbenv.git /usr/local/rbenv
RUN git clone https://github.com/rbenv/ruby-build.git /usr/local/rbenv/plugins/ruby-build
RUN /usr/local/rbenv/plugins/ruby-build/install.sh

ENV PATH /usr/local/rbenv/bin:/usr/local/rbenv/shims:$PATH

ENV RBENV_ROOT=/usr/local/rbenv

# install Ruby, bundler, Rails

RUN rbenv install 2.6.6
RUN rbenv install 2.7.2
RUN rbenv global 2.7.2
RUN rbenv rehash
RUN gem install bundler
#RUN gem install rails -v 5.2.2


# Install RubyMine
RUN mkdir -p /opt/rubymine

# latest version
#RUN curl -L "https://download.jetbrains.com/product?code=RM&latest&distribution=linux" | tar -C /opt/rubymine --strip-components 1 -xzvf -

# specific version
RUN curl -L "https://download.jetbrains.com/ruby/RubyMine-2023.2.5.tar.gz" | tar -C /opt/rubymine --strip-components 1 -xzvf -


# Add a binary to the PATH that points to the rubymine startup script for coder v1
RUN ln -s /opt/rubymine/bin/rubymine.sh /usr/local/bin/rubymine

ENV PATH /usr/local/bin:$PATH

# add Ruby on Rails to image
RUN gem install net-imap -v 0.3.7
RUN gem install rails -v 7.0.2.2

# packages required for jetbrains projector support
RUN DEBIAN_FRONTEND="noninteractive" apt-get update -y \
    && apt-get install -y \
        libxtst6 \
        libxrender1 \
        libfontconfig1 \
        libxi6 \
        libgtk-3-0

# change owner to coder so projector CLI can create a config
RUN chown -R coder:coder /opt

USER coder



