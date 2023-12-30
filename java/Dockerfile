#
# 2023-12-30 pushed to marktmilligan/java:jdk-11
# 
#

# Dockerfile
FROM codercom/enterprise-base:ubuntu

# Run everything as root
USER root

# Install JDK 11
RUN DEBIAN_FRONTEND="noninteractive" apt-get update -y && \
    apt-get install -y openjdk-11-jdk
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64
ENV PATH $PATH:$JAVA_HOME/bin

# Install Maven
# https://maven.apache.org/docs/history.html
ARG MAVEN_VERSION=3.9.6
ARG MAVEN_SHA512=706f01b20dec0305a822ab614d51f32b07ee11d0218175e55450242e49d2156386483b506b3a4e8a03ac8611bae96395fd5eec15f50d3013d5deed6d1ee18224

ENV MAVEN_HOME /usr/share/maven
ENV MAVEN_CONFIG "/home/kasmuser/.m2"

RUN mkdir -p $MAVEN_HOME $MAVEN_HOME/ref \
  && echo "Downloading maven" \
  && curl -fsSL -o /tmp/apache-maven.tar.gz https://apache.osuosl.org/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz \
  \
  && echo "Checking downloaded file hash" \
  && echo "${MAVEN_SHA512}  /tmp/apache-maven.tar.gz" | sha512sum -c - \
  \
  && echo "Unzipping maven" \
  && tar -xzf /tmp/apache-maven.tar.gz -C $MAVEN_HOME --strip-components=1 \
  \
  && echo "Cleaning and setting links" \
  && rm -f /tmp/apache-maven.tar.gz \
  && ln -s $MAVEN_HOME/bin/mvn /usr/bin/mvn

# Install Gradle
# https://gradle.org/releases/
ENV GRADLE_VERSION=8.5
ARG GRADLE_SHA256=9d926787066a081739e8200858338b4a69e837c3a821a33aca9db09dd4a41026

ENV GRADLE_HOME /usr/bin/gradle

RUN mkdir -p /usr/share/gradle /usr/share/gradle/ref \
  && echo "Downloading gradle" \
  && curl -fsSL -o /tmp/gradle.zip https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip \
  \
  && echo "Checking downloaded file hash" \
  && echo "${GRADLE_SHA256}  /tmp/gradle.zip" | sha256sum -c - \
  \
  && echo "Unziping gradle" \
  && unzip -d /usr/share/gradle /tmp/gradle.zip \
   \
  && echo "Cleaning and setting links" \
  && rm -f /tmp/gradle.zip \
  && ln -s /usr/share/gradle/gradle-${GRADLE_VERSION} /usr/bin/gradle

ENV PATH $PATH:$GRADLE_HOME/bin

# Set back to coder user
USER coder