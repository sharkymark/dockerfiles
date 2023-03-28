FROM codercom/enterprise-base:ubuntu

# Run everything as root
USER root
 
# Install JDK (OpenJDK 8)
RUN DEBIAN_FRONTEND="noninteractive" apt-get update -y && \
    apt-get install -y openjdk-11-jdk
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64
ENV PATH $PATH:$JAVA_HOME/bin

ANDROID_SDK_ROOT /usr/lib/android-sdk
ANDROID_HOME ${ANDROID_SDK_ROOT}
mkdir -p ${ANDROID_SDK_ROOT}

# Install cmdline-tools.
cd ${ANDROID_SDK_ROOT} && \
mkdir cmdline-tools && \
cd cmdline-tools && \
wget https://dl.google.com/android/repository/commandlinetools-linux-6858069_latest.zip && \
unzip *.zip && rm *.zip && \
mv cmdline-tools latest
export PATH=${PATH}:${ANDROID_SDK_ROOT}/cmdline-tools/latest/bin

# Install build tools.
yes | sdkmanager "build-tools;30.0.0"
export PATH=${PATH}:${ANDROID_SDK_ROOT}/platform-tools

# Install platform android-29.
yes | sdkmanager "platforms;android-30"

# Packages required for multi-editor support
DEBIAN_FRONTEND="noninteractive" apt-get update -y && \
apt-get install -y \
libxtst6 \
libxrender1 \
libfontconfig1 \
libxi6 \
libgtk-3-0

# Install Android Studio
add-apt-repository ppa:maarten-fonville/android-studio && \
apt update && \
apt install -y android-studio && \
ln -s /opt/android-studio/bin/studio.sh /usr/local/bin/studio