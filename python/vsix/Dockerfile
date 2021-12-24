FROM codercom/enterprise-base:ubuntu

# Run everything as root
USER root

# Download and install VS Code extensions to run in Code Web (code-server)
RUN mkdir -p /vsix
ADD ./ms-python.python-2020.10.332292344.vsix /vsix

# Add the new configure script
COPY configure /coder/configure

# Set back to coder user
USER coder




