FROM codercom/enterprise-multieditor:ubuntu

# Run everything as root
USER root

# Install JDK (OpenJDK 14)
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y openjdk-14-jdk
ENV JAVA_HOME /usr/lib/jvm/java-14-openjdk-amd64
ENV PATH $PATH:$JAVA_HOME/bin

# Install intellij.
RUN mkdir -p /opt/idea

ENV IDEA_VERSION=2020.3.4   
RUN curl -L "https://download.jetbrains.com/idea/ideaIU-${IDEA_VERSION}.tar.gz" | tar -C /opt/idea --strip-components 1 -xzvf -

# Add a binary to the PATH that points to the intellij startup script.
RUN ln -s /opt/idea/bin/idea.sh /usr/bin/intellij-idea-ultimate

# Set back to coder user
USER coder