FROM archlinux/base
SHELL ["/bin/bash", "-c"]
# Basic utilities
RUN pacman --noconfirm -Syu \
    base \
    base-devel \
    python \
    python-pip \
    wget \
    man \
    htop \
    shellcheck \
    git \
    vim \
    emacs \
    jq \
    openssh \
    docker \
    gcc \
    net-tools \
    inetutils \
    rsync

# Enable passwordless sudo for any user
COPY sudoers /etc/sudoers

# Add coder user
RUN useradd -mUs /bin/bash coder
USER coder

# Install poetry
RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python

# Add poetry to path
ENV PATH $PATH:/home/coder/.poetry/bin

# Globally install jupyter
RUN sudo pip install jupyterlab

# Globally install AWS autogluon autoML
RUN sudo pip install --upgrade mxnet
RUN sudo pip install autogluon

# go to coder home directory
WORKDIR /home/coder


