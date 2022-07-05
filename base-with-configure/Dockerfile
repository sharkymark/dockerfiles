FROM codercom/enterprise-base:ubuntu

# Run everything as root
USER root

# copy configure script to coder folder in container
COPY [ "configure", "/coder/configure" ]
RUN chmod +x /coder/configure

# copy folder to test if Coder deletes it from /tmp
COPY [ "client-coder", "/tmp/client-coder" ]
COPY [ "client-coder", "/coder/client-coder" ]

# Set back to coder user
USER coder