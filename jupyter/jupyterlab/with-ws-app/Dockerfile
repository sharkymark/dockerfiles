# inherit base image with python3
FROM codercom/enterprise-base:ubuntu

USER root

RUN pip3 install jupyter notebook
RUN pip3 install jupyterlab

# hide the jupyter notebook icon on the workspace dashboard by renaming the jupyter binary - but use jupyter-launcher to launch lab
RUN mv /usr/local/bin/jupyter /usr/local/bin/jupyter-launcher

# Install Python packages
RUN pip3 install pandas && \
    pip3 install numpy

# configure script to create a dev URL and launch JupyterLab without token or password
COPY ["configure", "/coder/configure"]
RUN chmod +x /coder/configure

# copy workspace apps info (config.yaml)
COPY ["./coder", "/coder"]

# change back to the coder user
USER coder