FROM docker.io/codercom/enterprise-pycharm:ubuntu

# Switch to root
USER root 

# As root, change the coder user id

RUN userdel coder && useradd -l -u 1000670000 coder && chown coder:coder /home/coder

# Go back to the user 'coder'
USER coder