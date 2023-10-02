FROM codercom/enterprise-node:ubuntu

# change to root to do installs
USER root

# install n, latest node, npm, typescript
RUN echo n | npm install -g --silent n
RUN n latest
RUN echo n | npm install -g --silent npm
RUN echo n | npm install -g --silent typescript
RUN echo n | npm install -g --silent create-react-app

# Install zsh
RUN apt install zsh -y

# Install fish
RUN apt install fish -y

# Microsoft Visual Studio Code required packages
RUN DEBIAN_FRONTEND="noninteractive" apt-get update -y && \
    apt-get install -y \
    libnss3 \
    libatk-bridge2.0-0 \
    libatk1.0-0 \
    libatspi2.0-0 \
    libcairo2 \
    libdrm2 \
    libgbm1 \
    libgtk-3-0 \
    libnspr4 \
    libpango-1.0-0 \
    libsecret-1-0 \
    libxcomposite1 \
    libxdamage1 \
    libxfixes3 \
    libxkbcommon0 \
    libxkbfile1 \
    libxrandr2 \
    xdg-utils

# change back to non-root root
USER coder
