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
    pip3 install pandas


# Set back to coder user
USER coder