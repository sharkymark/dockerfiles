FROM codercom/enterprise-intellij:ubuntu

# Run everything as root
USER root

COPY ["./coder", "/coder"]
RUN chown -R coder /coder/apps

# Set back to coder user
USER coder