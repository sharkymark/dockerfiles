FROM salesforce/salesforcedx:latest-slim

# Install baseline packages
RUN apt-get update && \
    DEBIAN_FRONTEND="noninteractive" apt-get install --yes \
      bash \
      build-essential \
      ca-certificates \
      curl \
      docker.io \
      htop \
      locales \
      man \
      python3 \
      python3-pip \
      software-properties-common \
      sudo \
      systemd \
      systemd-sysv \
      unzip \
      vim \
      wget && \
    # Install latest Git using their official PPA
    add-apt-repository ppa:git-core/ppa && \
    DEBIAN_FRONTEND="noninteractive" apt-get install --yes git

# Run everything as root
USER root


# Add a user `coder` so that you're not developing as the `root` user
RUN useradd coder \
      --create-home \
      --shell=/bin/bash \
      --groups=docker \
      --uid=1000 \
      --user-group && \
    echo "coder ALL=(ALL) NOPASSWD:ALL" >>/etc/sudoers.d/nopasswd

# Download and install VS Code extensions to run in code-server that Salesforce requires
RUN mkdir -p /vsix
ADD ./vsix/salesforce.salesforce-vscode-slds-1.4.2.vsix /vsix
ADD ./vsix/salesforce.salesforcedx-vscode-apex-51.10.0.vsix /vsix
ADD ./vsix/salesforce.salesforcedx-vscode-apex-debugger-51.10.0.vsix /vsix
ADD ./vsix/salesforce.salesforcedx-vscode-apex-replay-debugger-51.10.0.vsix /vsix 
ADD ./vsix/salesforce.salesforcedx-vscode-core-51.10.0.vsix /vsix
ADD ./vsix/salesforce.salesforcedx-vscode-lightning-51.10.0.vsix /vsix
ADD ./vsix/salesforce.salesforcedx-vscode-lwc-51.10.0.vsix /vsix
ADD ./vsix/salesforce.salesforcedx-vscode-visualforce-51.10.0.vsix /vsix

# Set back to coder user
USER coder




