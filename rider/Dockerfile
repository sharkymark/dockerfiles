FROM codercom/enterprise-multieditor:ubuntu

# Run everything as root
USER root

# Install rider.
RUN mkdir -p /opt/rider
RUN curl -L "https://download.jetbrains.com/product?code=RD&latest&distribution=linux" | tar -C /opt/rider --strip-components 1 -xzvf -

RUN apt-get update && \
    DEBIAN_FRONTEND="noninteractive" apt-get install --yes \
    libsecret-1-0 \
    gnome-keyring

# Add a binary to the PATH that points to the pycharm startup script.
RUN ln -s /opt/rider/bin/rider.sh /usr/bin/rider

# Add the new configure script
COPY configure /coder/configure
# Copy .net install script to image
COPY dotnet-install.sh /coder/dotnet-install.sh

# Install Power Shell
# Install pre-requisite packages.
RUN sudo apt-get install -y wget apt-transport-https software-properties-common
# Download the Microsoft repository GPG keys
RUN wget -q https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb
# Register the Microsoft repository GPG keys
RUN sudo dpkg -i packages-microsoft-prod.deb
# Update the list of packages after we added packages.microsoft.com
RUN sudo apt-get update
# Install PowerShell
RUN sudo apt-get install -y powershell

# Set back to coder user
USER coder
