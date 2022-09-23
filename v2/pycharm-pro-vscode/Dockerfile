# jdk 11 and python 3.x are in the base image along with git, curl, sudo
FROM codercom/enterprise-base:ubuntu

# Run everything as root
USER root

# Packages required for JetBrains projector (web browser) support
RUN apt-get update && \
    DEBIAN_FRONTEND="noninteractive" apt-get install -y \
    libxtst6 \
    libxrender1 \
    libfontconfig1 \
    libxi6 \
    libgtk-3-0

# Install PyCharm Professional Edition
RUN mkdir -p /opt/pycharm
RUN curl -L "https://download.jetbrains.com/product?code=PCP&latest&distribution=linux" | tar -C /opt/pycharm --strip-components 1 -xzvf - && \
ln -s /opt/pycharm/bin/pycharm.sh /usr/bin/pycharm.sh && \
cp /opt/pycharm/bin/idea.properties /opt/pycharm/bin/idea.properties.orig && \
chown coder:coder /opt/pycharm/bin/idea.properties

# download and install code-server (VS Code in a browser)
RUN curl -fsSL https://code-server.dev/install.sh | sh

# configure script (for installing VS Code extensions)
COPY ["configure", "/coder/configure"]
RUN chmod +x /coder/configure

# Set back to coder user
USER coder

RUN pip install projector-installer --user && \
mkdir -p ~/.projector/apps && \
ln -s /opt/pycharm ~/.projector/apps/pycharm && \
~/.local/bin/projector --accept-license config add PyCharm ~/.projector/apps/pycharm --port 8997 --hostname=localhost --use-separate-config && \
sudo mv /opt/pycharm/bin/idea.properties.orig /opt/pycharm/bin/idea.properties && \
sudo mkdir -p /opt/projector /opt/.local && \
sudo chown -R coder:coder /opt/projector /opt/.local && \
cp -R ~/.projector/configs /opt/projector && \
cp -R ~/.local/bin /opt/.local && \
cp -R ~/.local/lib /opt/.local && \
rm -rf ~/.local ~/.projector ~/.cache

# install pandas data science package
RUN pip3 install pandas
# install jupyter
RUN pip3 install jupyter notebook
RUN pip3 install jupyterlab