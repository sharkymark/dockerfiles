FROM codercom/enterprise-base:ubuntu

# Run everything as root
USER root

# install jupyter IDE
RUN pip3 install jupyterlab

# copy vs code extension into a new folder
RUN mkdir -p /vsix
ADD ./ms-toolsai.jupyter.2020.12.1.vsix /vsix

# Add the new configure script
COPY configure /coder/configure

# Set back to coder user
USER coder




