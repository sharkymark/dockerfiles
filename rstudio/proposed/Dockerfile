FROM codercom/enterprise-multieditor:ubuntu

# Run everything as root
USER root

# Install dependencies
RUN apt-get update && \
DEBIAN_FRONTEND="noninteractive" apt-get install --yes \
bash \
sudo \
git \
ssh \
locales \
wget \
r-base \
gdebi-core

# Install RStudio
RUN wget https://download2.rstudio.org/server/bionic/amd64/rstudio-server-2022.02.1-461-amd64.deb && \
gdebi --non-interactive rstudio-server-2022.02.1-461-amd64.deb

# Ensure rstudio files can be written to by the coder user.
RUN chown -R coder:coder /var/lib/rstudio-server
RUN echo "server-pid-file=/tmp/rstudio-server.pid" >> /etc/rstudio/rserver.conf
RUN echo "server-data-dir=/tmp/rstudio" >> /etc/rstudio/rserver.conf
RUN echo "www-frame-origin=same" >> /etc/rstudio/rserver.conf
RUN echo "server-user=coder" >> /etc/rstudio/rserver.conf

# Remove the following line if you do not run Coder on https
RUN echo "server-add-header=X-Forwarded-Proto: https" >> /etc/rstudio/rserver.conf

# Assign password "rstudio" to coder user.
RUN echo 'coder:rstudio' | chpasswd

# Assign locale
RUN locale-gen en_US.UTF-8

# Set back to coder user
USER coder

# Add RStudio to path
ENV PATH /usr/lib/rstudio-server/bin:${PATH}


