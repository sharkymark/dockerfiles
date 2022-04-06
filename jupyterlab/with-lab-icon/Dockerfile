# inherit Coder's Jupyter image
FROM codercom/enterprise-jupyter:ubuntu

USER root

# rename the notebook script
RUN mv /usr/local/bin/jupyter /usr/local/bin/jupyter.py
# replace the notebook script with the image-injected lab script
COPY jupyter /usr/local/bin/jupyter

# inject the lab icon
COPY jupyterlab.svg /usr/local/bin/jupyterlab.svg

# configure script to move the lab icon into code-server plug-in location that Coder expects
COPY ["configure", "/coder/configure"]
RUN chmod +x /coder/configure

# change back to the coder user
USER coder