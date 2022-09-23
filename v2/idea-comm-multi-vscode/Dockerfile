# jdk 11 and python 3.x are in the base image along with git, curl, sudo
FROM codercom/enterprise-java:ubuntu

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

# INTELLIJ (Java) IDE download and install (latest release. note: re-build image to get latest periodically)

# Install IntelliJ IDEA Ultimate.
#RUN mkdir -p /opt/idea
#RUN curl -L "https://download.jetbrains.com/product?code=IIU&latest&distribution=linux" | tar -C /opt/idea --strip-components 1 -xzvf - && \
#ln -s /opt/idea/bin/idea.sh /usr/bin/intellij-idea-ultimate && \
#cp /opt/idea/bin/idea.properties /opt/idea/bin/idea.properties.orig && \
#chown coder:coder /opt/idea/bin/idea.properties

# Install IntelliJ Community Edition
RUN mkdir -p /opt/idea-comm
RUN curl -L "https://download.jetbrains.com/product?code=IIC&latest&distribution=linux" | tar -C /opt/idea-comm --strip-components 1 -xzvf - && \
ln -s /opt/idea-comm/bin/idea.sh /usr/bin/intellij-idea-community  && \
cp /opt/idea-comm/bin/idea.properties /opt/idea-comm/bin/idea.properties.orig && \
chown coder:coder /opt/idea-comm/bin/idea.properties

# download and install code-server (VS Code in a browser)
RUN curl -fsSL https://code-server.dev/install.sh | sh

# configure script (for installing VS Code extensions)
COPY ["configure", "/coder/configure"]
RUN chmod +x /coder/configure

# Set back to coder user
USER coder

RUN pip install projector-installer --user && \
mkdir -p ~/.projector/apps && \
ln -s /opt/idea-comm ~/.projector/apps/idea-comm && \
~/.local/bin/projector --accept-license config add IntelliJ1 ~/.projector/apps/idea-comm --port 8997 --hostname=localhost --use-separate-config && \
~/.local/bin/projector --accept-license config add IntelliJ2 ~/.projector/apps/idea-comm --port 8998 --hostname=localhost --use-separate-config && \
sudo mv /opt/idea-comm/bin/idea.properties.orig /opt/idea-comm/bin/idea.properties && \
sudo mkdir -p /opt/projector /opt/.local && \
sudo chown -R coder:coder /opt/projector /opt/.local && \
cp -R ~/.projector/configs /opt/projector && \
cp -R ~/.local/bin /opt/.local && \
cp -R ~/.local/lib /opt/.local && \
rm -rf ~/.local ~/.projector ~/.cache