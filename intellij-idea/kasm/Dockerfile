#
# https://kasmweb.com/docs/latest/guide/custom_images.html
# https://github.com/Kong/insomnia/releases
#
# 2023-02-11 built and pushed image to docker.io marktmilligan/intellij-community-kasm:2022.3.2
#

FROM kasmweb/desktop:1.12.0

USER root

COPY kasmvnc.yaml /etc/kasmvnc/kasmvnc.yaml
COPY vnc_startup.sh /dockerstartup/vnc_startup.sh
RUN cp -r /home/kasm-user /tmp/kasm-user
RUN apt-get update && apt-get install sudo
RUN echo "kasm-user ALL=(ALL) NOPASSWD:ALL" >>/etc/sudoers.d/nopasswd
RUN DEBIAN_FRONTEND=noninteractive make-ssl-cert generate-default-snakeoil --force-overwrite
RUN adduser kasm-user ssl-cert

# Install baseline packages
RUN apt-get update && \
    DEBIAN_FRONTEND="noninteractive" apt-get install --yes \
      bash \
      curl \
      htop \
      locales \
      man \
      python3 \
      python3-pip \
      software-properties-common \
      sudo \
      vim \
      wget \
      rsync

# Install JDK (OpenJDK 8)
RUN DEBIAN_FRONTEND="noninteractive" apt-get update -y && \
    apt-get install -y openjdk-11-jdk
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64
ENV PATH $PATH:$JAVA_HOME/bin

# Install IntelliJ IDEA Community
RUN mkdir -p /opt/idea
RUN curl -L "https://download.jetbrains.com/product?code=IC&latest&distribution=linux" | tar -C /opt/idea --strip-components 1 -xzvf -

USER 1000