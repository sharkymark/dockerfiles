FROM codercom/enterprise-base:ubuntu

# Run everything as root
USER root

# Install zsh
RUN apt install zsh -y

# Install fish
RUN apt install fish -y

RUN mkdir /coder

# Copy dotfiles to image
COPY [".bashrc", ".zshrc", "config.fish","/coder"]

# Return to Coder user
USER coder
