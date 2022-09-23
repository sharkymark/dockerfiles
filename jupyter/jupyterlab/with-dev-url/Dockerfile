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

# install supervisord
RUN apt-get update && apt-get install -y supervisor
RUN mkdir -p /var/log/supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# change back to the coder user
USER coder