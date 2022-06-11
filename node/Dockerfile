FROM codercom/enterprise-node:ubuntu
USER root

RUN echo n | npm install -g --silent n
RUN n stable
RUN echo n | npm install -g --silent npm
RUN echo n | npm install -g --silent typescript
RUN echo n | npm install -g --silent create-react-app

USER coder
