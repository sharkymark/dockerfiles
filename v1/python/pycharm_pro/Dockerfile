FROM codercom/enterprise-multieditor:ubuntu

# Run everything as root
USER root

# Install pycharm.
RUN mkdir -p /opt/pycharm
RUN curl -L "https://download.jetbrains.com/product?code=PCP&latest&distribution=linux" | tar -C /opt/pycharm --strip-components 1 -xzvf -

# Add a binary to the PATH that points to the pycharm startup script.
RUN ln -s /opt/pycharm/bin/pycharm.sh /usr/bin/pycharm

# configure script
COPY ["configure", "/coder/configure"]
RUN chmod +x /coder/configure

# Set back to coder user
USER coder




