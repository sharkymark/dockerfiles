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

# Install PyCharm Community Edition
RUN mkdir -p /opt/pycharm-comm
RUN curl -L "https://download.jetbrains.com/product?code=PCC&latest&distribution=linux" | tar -C /opt/pycharm-comm --strip-components 1 -xzvf - && \
ln -s /opt/pycharm-comm/bin/pycharm.sh /usr/bin/pycharm-community.sh && \
cp /opt/pycharm-comm/bin/idea.properties /opt/pycharm-comm/bin/idea.properties.orig && \
chown coder:coder /opt/pycharm-comm/bin/idea.properties

# download and install code-server (VS Code in a browser)
RUN curl -fsSL https://code-server.dev/install.sh | sh

# configure script (for installing VS Code extensions)
COPY ["configure", "/coder/configure"]
RUN chmod +x /coder/configure

# Set back to coder user
USER coder

RUN pip install projector-installer --user && \
mkdir -p ~/.projector/apps && \
ln -s /opt/pycharm-comm ~/.projector/apps/pycharm-comm && \
~/.local/bin/projector --accept-license config add PyCharm ~/.projector/apps/pycharm-comm --port 8997 --hostname=localhost --use-separate-config && \
sudo mv /opt/pycharm-comm/bin/idea.properties.orig /opt/pycharm-comm/bin/idea.properties && \
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