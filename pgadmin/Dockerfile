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

# Set back to coder user
USER coder