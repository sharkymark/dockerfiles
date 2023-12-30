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

# change back to non-root root
USER coder
