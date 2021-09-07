FROM codercom/enterprise-node:ubuntu
USER root

RUN echo n | npm install -g --silent typescript && \
    echo n | npm install -g --silent @angular/cli && \
    echo n | npm install -g --silent tfx-cli

USER coder
