FROM codercom/enterprise-java:ubuntu

USER root

# Install IntelliJ IDEA Ultimate
RUN mkdir -p /opt/idea
RUN curl -L \
"https://download.jetbrains.com/product?code=IU&latest&distribution=linux" \
| tar -C /opt/idea --strip-components 1 -xzvf -

# Create a symbolic link in PATH that points to the Intellij startup script.
RUN ln -s /opt/idea/bin/idea.sh /usr/bin/intellij-idea-ultimate

# Packages required for JetBrains-in-a-browser support
RUN apt-get update && \
    DEBIAN_FRONTEND="noninteractive" apt-get install -y \
    libxtst6 \
    libxrender1 \
    libfontconfig1 \
    libxi6 \
    libgtk-3-0

# bash .profile so projector can be added to the path
COPY [".profile", "/coder/.profile"]

# configure script
COPY ["configure", "/coder/configure"]
RUN chmod +x /coder/configure

# copy custom apps info (config.yaml)
COPY ["./coder", "/coder"]

# Set back to coder user
USER coder

