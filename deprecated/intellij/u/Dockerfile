# Dockerfile
#
# JetBrains IntelliJ IDEA Ultimate
# 2023-10-14 build and push to DockerHub tag 2022.2.3
# 2023-04-26 build and push to DockerHub tag 2022.1.4
# marktmilligan/iu-chown:2023.2.3
# marktmilligan/iu-chown:2022.1.4
# marktmilligan/iu-chown:2021.3.3
#
# https://data.services.jetbrains.com/products/releases?code=IU
#
# docker build -t marktmilligan/iu-chown:2023.2.3 .
# docker push marktmilligan/iu-chown:2023.2.3
#
FROM codercom/enterprise-java:ubuntu

# Run everything as root
USER root

# Packages required for multi-editor support
RUN DEBIAN_FRONTEND="noninteractive" apt-get update -y \
    && apt-get install -y \
        libxtst6 \
        libxrender1 \
        libfontconfig1 \
        libxi6 \
        libgtk-3-0

# Install IntelliJ IDEA Ultimate.
RUN mkdir -p /opt/idea
RUN curl -L "https://download.jetbrains.com/idea/ideaIU-2023.2.3.tar.gz" | tar -C /opt/idea --strip-components 1 -xzvf -

# change owner to coder so projector CLI can create a config
RUN chown -R coder:coder /opt

# Set back to coder user
USER coder