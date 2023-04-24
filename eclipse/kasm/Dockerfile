#
# https://kasmweb.com/docs/latest/guide/custom_images.html
# Eclipse 4.27 (2023-03)
# https://download.eclipse.org/eclipse/downloads/
# Click on Linux x86_64 link, then right-click the download link and copy it for the wget url 
# It includes the mirror, add &r=1 after mirror
#
# https://apache.osuosl.org/maven/maven-3/3.9.1/
# https://maven.apache.org/download.cgi
#
# 2023-04-24 built and pushed image to docker.io marktmilligan/eclipse-kasm:2023-03
#

FROM kasmweb/desktop:1.12.0

USER root

COPY kasmvnc.yaml /etc/kasmvnc/kasmvnc.yaml
COPY vnc_startup.sh /dockerstartup/vnc_startup.sh
COPY kasm_default_profile.sh /dockerstartup/kasm_default_profile.sh
RUN cp -r /home/kasm-user /tmp/kasm-user
RUN apt-get update && apt-get install sudo
RUN echo "kasm-user ALL=(ALL) NOPASSWD:ALL" >>/etc/sudoers.d/nopasswd
RUN DEBIAN_FRONTEND=noninteractive make-ssl-cert generate-default-snakeoil --force-overwrite
RUN adduser kasm-user ssl-cert

# Install baseline packages
RUN apt-get update && \
    DEBIAN_FRONTEND="noninteractive" apt-get install --yes \
      bash \
      curl \
      htop \
      locales \
      man \
      python3 \
      python3-pip \
      software-properties-common \
      sudo \
      vim \
      wget \
      rsync

# Install JDK 
RUN DEBIAN_FRONTEND="noninteractive" apt-get update -y && \
    apt-get install -y openjdk-11-jdk
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64
ENV PATH $PATH:$JAVA_HOME/bin


# Install Gradle
# https://gradle.org/releases/
ENV GRADLE_VERSION=7.6
ARG GRADLE_SHA256=7ba68c54029790ab444b39d7e293d3236b2632631fb5f2e012bb28b4ff669e4b

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

# Install Maven
# https://maven.apache.org/docs/history.html
ARG MAVEN_VERSION=3.9.1
ARG MAVEN_SHA512=d3be5956712d1c2cf7a6e4c3a2db1841aa971c6097c7a67f59493a5873ccf8c8b889cf988e4e9801390a2b1ae5a0669de07673acb090a083232dbd3faf82f3e3

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

# Install eclipse
RUN wget "https://www.eclipse.org/downloads/download.php?file=/eclipse/downloads/drops4/R-4.27-202303020300/eclipse-SDK-4.27-linux-gtk-x86_64.tar.gz&mirror_id=1294&r=1" -O /tmp/eclipse.tar.gz && \
tar -xf /tmp/eclipse.tar.gz -C /opt --no-same-owner && \
rm /tmp/eclipse.tar.gz

USER 1000