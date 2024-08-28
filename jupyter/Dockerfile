#
# 2024-08-05 marktmilligan/jupyter:latest
#
# https://jupyter.org/install
# https://github.com/jupyterlab/jupyterlab/releases
# https://pandas.pydata.org/
# https://github.com/coder/enterprise-images/tree/main/images/base
#

# dockerfile
FROM codercom/enterprise-base:ubuntu

# run everything as root
USER root

# install jupyter and pandas
RUN pip3 install jupyterlab && \
    pip3 install jupyter-core && \
    pip3 install notebook && \
    pip3 install pandas && \
    pip3 install prettytable

ARG CACHEBUST=1
RUN curl -fsSL https://code-server.dev/install.sh | sh -s -- --method=standalone --prefix=/tmp/code-server \
&& rm -rf /tmp/code-server/install.sh

# Set back to coder user
USER coder