FROM codercom/enterprise-base:ubuntu

# https://nodejs.org/en/about/previous-releases
# https://nodejs.org/en/download/
# https://github.com/nodesource/distributions/blob/master/README.md#debinstall

# if you want LTS
# https://deb.nodesource.com/setup_lts.x


# 2023-12-30 pushed marktmilligan/node:20.10.0

# Run everything as root
USER root

# Install whichever Node version is LTS
RUN curl -sL https://deb.nodesource.com/setup_20.x | bash -
RUN DEBIAN_FRONTEND="noninteractive" apt-get update -y && \
    apt-get install -y nodejs

# Install yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN DEBIAN_FRONTEND="noninteractive" apt-get update && apt-get install -y yarn

# Install zsh
RUN apt install zsh -y

# Install fish
RUN apt install fish -y

# Set back to coder user
USER coder