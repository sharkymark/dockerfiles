FROM marktmilligan/intellij-ultimate:latest

# Run everything as root
USER root

# projector launch scripts for additional IntelliJ IDEs
COPY ["projector-idea-ultimate-1.sh", "/opt/idea/bin/projector-idea-ultimate-1.sh"]
RUN chmod +x /opt/idea/bin/projector-idea-ultimate-1.sh

# copy custom apps info (config.yaml)
COPY ["./coder", "/coder"]

# Set back to coder user
USER coder

