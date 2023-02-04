FROM codercom/enterprise-base:ubuntu

# Run everything as root
USER root

# Install dependencies
RUN apt-get update && \
DEBIAN_FRONTEND="noninteractive" apt-get install --yes \
r-base \
gdebi-core

# Install RStudio
RUN wget https://download2.rstudio.org/server/bionic/amd64/rstudio-server-2022.02.3-492-amd64.deb && \
gdebi --non-interactive rstudio-server-2022.02.3-492-amd64.deb

# Ensure rstudio files can be written to by the coder user.
RUN chown -R coder:coder /var/lib/rstudio-server

# Make directory for rstudio data in home dir
RUN mkdir /home/coder/.rstudio && chown -R coder:coder /home/coder/.rstudio
# Set up rstudio config to work for the coder user
RUN echo "server-pid-file=/tmp/rstudio-server.pid" >> /etc/rstudio/rserver.conf
RUN echo "www-frame-origin=same" >> /etc/rstudio/rserver.conf
# Run rstudio data in user home directory as coder user
RUN echo "server-user=coder" >> /etc/rstudio/rserver.conf
RUN echo "server-data-dir=/home/coder/.rstudio/data" >> /etc/rstudio/rserver.conf
RUN echo "database-config-file=/etc/rstudio/database.conf" >> /etc/rstudio/rserver.conf
# Database conf
RUN echo "provider=sqlite" >> /etc/rstudio/database.conf
RUN echo "directory=/home/coder/.rstudio" >> /etc/rstudio/database.conf
# Launcher config -- Use TLS
# If your coder deployment is NOT on tls, you will want to remove this line.
RUN echo "enable-ssl=1" >> /etc/rstudio/launcher.conf

# Assign locale
RUN locale-gen en_US.UTF-8

# Set back to coder user
USER coder

# Add RStudio to path
ENV PATH /usr/lib/rstudio-server/bin:${PATH}


