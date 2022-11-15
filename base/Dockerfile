FROM codercom/enterprise-base:ubuntu

# Run everything as root
USER root

# copy personalize script to image, with execute permissions
COPY ["personalize", "/coder/personalize"]
RUN chmod +x /coder/personalize

# copy configure script to image, with execute permissions
COPY ["configure", "/coder/configure"]
RUN chmod +x /coder/configure

# Return to Coder user
USER coder
