FROM codercom/enterprise-multieditor:ubuntu

# Run everything as root
USER root

# Install pycharm.
RUN mkdir -p /opt/pycharm
RUN curl -L "https://download.jetbrains.com/product?code=PCP&latest&distribution=linux" | tar -C /opt/pycharm --strip-components 1 -xzvf -

# Add a binary to the PATH that points to the pycharm startup script.
RUN ln -s /opt/pycharm/bin/pycharm.sh /usr/bin/pycharm

# install jupyter IDE
RUN pip3 install jupyterlab

# Download and install VS Code extensions to run in code-server
RUN mkdir -p /vsix
ADD ./dongli.python-preview-0.0.4.vsix /vsix
ADD ./ms-python.python-2020.10.332292344.vsix /vsix
ADD ./ms-toolsai.jupyter.2020.12.1.vsix /vsix

# Add the new configure script
COPY configure /coder/configure

# Set back to coder user
USER coder




