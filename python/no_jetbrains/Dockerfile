FROM codercom/enterprise-multieditor:ubuntu

# Run everything as root
USER root

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




