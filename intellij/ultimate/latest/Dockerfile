FROM codercom/enterprise-multieditor:ubuntu

# Run everything as root
USER root

# Install JDK (OpenJDK 14)
RUN apt-get update && DEBIAN_FRONTEND="noninteractive" apt-get install -y \
    openjdk-11-jdk
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64
ENV PATH $PATH:$JAVA_HOME/bin

# Install intellij IDEA Ultimate.
RUN mkdir -p /opt/idea
RUN curl -L "https://download.jetbrains.com/product?code=IIU&latest&distribution=linux" | tar -C /opt/idea --strip-components 1 -xzvf -

# Add a binary to the PATH that points to the intellij startup script.
RUN ln -s /opt/idea/bin/idea.sh /usr/bin/intellij-idea-ultimate

# Install intellij Community Edition
RUN mkdir -p /opt/idea-comm
RUN curl -L "https://download.jetbrains.com/product?code=IIC&latest&distribution=linux" | tar -C /opt/idea-comm --strip-components 1 -xzvf -

# Add a binary to the PATH that points to the intellij startup script.
RUN ln -s /opt/idea-comm/bin/idea.sh /usr/bin/intellij-idea-community

# Set back to coder user
USER coder