FROM codercom/enterprise-multieditor:ubuntu

# Run everything as root
USER root

RUN mkdir -p /opt/pycharm

# comment out pycharm pro edition
# Install pycharm professional edition

#RUN curl -L "https://download.jetbrains.com/product?code=PCP&latest&distribution=linux" | tar -C /opt/pycharm --strip-components 1 -xzvf -
# Add a binary to the PATH that points to the pycharm startup script.
#RUN ln -s /opt/pycharm/bin/pycharm.sh /usr/bin/pycharm


RUN curl -L "https://download.jetbrains.com/product?code=PCC&latest&distribution=linux" | tar -C /opt/pycharm --strip-components 1 -xzvf -
RUN ln -s /opt/pycharm/bin/pycharm.sh /usr/bin/pycharm-community

# install jupyter
RUN pip3 install jupyter notebook
RUN pip3 install jupyterlab

# rename the jupyter binary and copy the new jupyter script that passes jupyterlab arguments
RUN mv /usr/local/bin/jupyter /usr/local/bin/jupyter.py
COPY jupyter /usr/local/bin/jupyter

# Download and install VS Code extensions to run in code-server
RUN mkdir -p /vsix
ADD ./dongli.python-preview-0.0.4.vsix /vsix
ADD ./vs-code-extensions-python.txt /vsix

# Add the new configure script
COPY configure /coder/configure

# image will be marktmilligan/pycharm-jupyter-python3:latest

# Set back to coder user
USER coder




