FROM codercom/enterprise-vnc:ubuntu

USER root

# Install Snap and JRE
RUN apt-get update && \
    DEBIAN_FRONTEND="noninteractive" apt-get install --yes default-jre

# Install eclipse
ENV major=R
ENV version=4.24
RUN wget "https://www.eclipse.org/downloads/download.php?file=/eclipse/downloads/drops4/$major-4.24-202206070700/eclipse-SDK-$version-linux-gtk-x86_64.tar.gz&mirror_id=518&r=1" -O /tmp/eclipse.tar.gz && \
tar -xf /tmp/eclipse.tar.gz -C /opt --no-same-owner && \
rm /tmp/eclipse.tar.gz

# Install xdotool (for desktop apps)
RUN sudo apt-get install -y xdotool

# Move the VNC configure script
RUN mv /coder/configure /coder/configure-vnc

# Copy /coder/ folder (configure and applications)
COPY ["./coder", "/coder"]

# Give Coder user permissions to applications folder
RUN chown -R coder /coder/apps

USER coder
