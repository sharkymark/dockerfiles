FROM codercom/enterprise-multieditor:ubuntu

# Run everything as root
USER root

# Install the public key for the repository (if not done previously):
RUN curl https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo apt-key add

# Create the repository configuration file:
RUN sh -c 'echo "deb https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update'

# Install pgAdmin for web mode only: 
RUN apt-get update && \
    DEBIAN_FRONTEND="noninteractive" apt-get install --yes \
      pgadmin4-web


ENV PGADMIN_SETUP_EMAIL pgadmin@pgadmin.org
ENV PGADMIN_SETUP_PASSWORD pgadmin

# copy configure script to coder folder in container
COPY [ "configure", "/coder/configure" ]

RUN mkdir -p /opt/pycharm

# Install latest pycharm professional edition
#RUN curl -L "https://download.jetbrains.com/product?code=PCP&latest&distribution=linux" | tar -C /opt/pycharm --strip-components 1 -xzvf -

# Add a binary to the PATH that points to the pycharm startup script.
#RUN ln -s /opt/pycharm/bin/pycharm.sh /usr/bin/pycharm

# Install latest pycharm community edition
RUN curl -L "https://download.jetbrains.com/product?code=PCC&latest&distribution=linux" | tar -C /opt/pycharm --strip-components 1 -xzvf -

# Add a binary to the PATH that points to the pycharm startup script.
RUN ln -s /opt/pycharm/bin/pycharm.sh /usr/bin/pycharm-community


# install postgres
RUN apt-get update && \
    DEBIAN_FRONTEND="noninteractive" apt-get install --yes \
      postgresql \
      postgresql-contrib

# install supervisord
RUN apt-get update && apt-get install -y supervisor
RUN mkdir -p /var/log/supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf      

# Set back to coder user
USER coder