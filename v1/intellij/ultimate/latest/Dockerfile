FROM codercom/enterprise-java:ubuntu

# Run everything as root
USER root

# Packages required for multi-editor support
RUN apt-get update && \
    DEBIAN_FRONTEND="noninteractive" apt-get install -y \
    libxtst6 \
    libxrender1 \
    libfontconfig1 \
    libxi6 \
    libgtk-3-0

# Install intellij IDEA Ultimate.
RUN mkdir -p /opt/idea
RUN curl -L "https://download.jetbrains.com/idea/ideaIU-2023.1.tar.gz" | tar -C /opt/idea --strip-components 1 -xzvf -

# Add a binary to the PATH that points to the intellij startup script.
RUN ln -s /opt/idea/bin/idea.sh /usr/bin/intellij-idea-ultimate

# Set back to coder user
USER coder