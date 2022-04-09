# inherit Coder's Jupyter image
FROM codercom/enterprise-jupyter:ubuntu

USER root

# hide the Jupyter notebook icon - but use jupyter-launcher to launch lab
RUN mv /usr/local/bin/jupyter /usr/local/bin/jupyter-launcher

# Install Python packages
RUN pip3 install pandas && \
    pip3 install numpy

# configure script to create a dev URL and launch JupyterLab without token or password
COPY ["configure", "/coder/configure"]
RUN chmod +x /coder/configure

# change back to the coder user
USER coder