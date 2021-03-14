FROM codercom/enterprise-multieditor:ubuntu

# Run everything as root
USER root

# Install rider.
RUN mkdir -p /opt/rider
RUN curl -L "https://download.jetbrains.com/product?code=RD&latest&distribution=linux" | tar -C /opt/rider --strip-components 1 -xzvf -

# Add a binary to the PATH that points to the pycharm startup script.
RUN ln -s /opt/rider/bin/rider.sh /usr/bin/rider

# Set back to coder user
USER coder
