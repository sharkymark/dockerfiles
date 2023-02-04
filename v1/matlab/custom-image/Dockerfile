# See our guides for writing custom images:
# https://coder.com/docs/guides/customization

FROM codercom/enterprise-base:ubuntu

USER root

# -- Base dependencies --
# https://github.com/mathworks-ref-arch/container-images/tree/main/matlab-deps/r2022a/ubuntu20.04
ENV DEBIAN_FRONTEND="noninteractive" TZ="Etc/UTC"

COPY base-dependencies.txt /tmp/base-dependencies.txt

RUN apt-get update && apt-get install --no-install-recommends -y $(cat /tmp/base-dependencies.txt) \
    && apt-get clean && apt-get -y autoremove && rm -rf /var/lib/apt/lists/*

RUN [ -d /usr/share/X11/xkb ] || mkdir -p /usr/share/X11/xkb

# Install patched glibc - See https://github.com/mathworks/build-glibc-bz-19329-patch
# Note: base-dependencies.txt includes libcrypt-dev and linux-libc-dev to enable installation of patched -dev packages
WORKDIR /packages
RUN export DEBIAN_FRONTEND=noninteractive \
    && wget -q https://github.com/mathworks/build-glibc-bz-19329-patch/releases/download/ubuntu-focal/all-packages.tar.gz \
    && tar -x -f all-packages.tar.gz \
        --exclude glibc-*.deb \
        --exclude libc6-dbg*.deb \
    && apt-get install --yes --no-install-recommends ./*.deb \
    && rm -fr /packages
WORKDIR /

# -- Install the IDE --
# https://github.com/mathworks-ref-arch/matlab-dockerfile/blob/main/Dockerfile

ARG MATLAB_RELEASE=r2022a

# Install mpm dependencies
RUN export DEBIAN_FRONTEND=noninteractive && apt-get update \
    && apt-get install --no-install-recommends --yes \
        wget \
        unzip \
        ca-certificates \
    && apt-get clean && apt-get autoremove

# Run mpm to install MATLAB in the target location and delete the mpm installation afterwards.
# If mpm fails to install successfully then output the logfile to the terminal, otherwise cleanup.
RUN wget -q https://www.mathworks.com/mpm/glnxa64/mpm && \ 
chmod +x mpm \
    && ./mpm install \
        --release=${MATLAB_RELEASE} \
        --destination=/opt/matlab \
        --products MATLAB \
    || (echo "MPM Installation Failure. See below for more information:" && cat /tmp/mathworks_root.log && false) \
    && rm -f mpm /tmp/mathworks_root.log \
    && ln -s /opt/matlab/bin/matlab /usr/local/bin/matlab

# One of the following 2 ways of configuring the license server to use must be
# uncommented.

#ARG LICENSE_SERVER
# Specify the host and port of the machine that serves the network licenses
# if you want to bind in the license info as an environment variable. This
# is the preferred option for licensing. It is either possible to build with
# something like --build-arg LICENSE_SERVER=27000@MyServerName, alternatively
# you could specify the license server directly using
#       ENV MLM_LICENSE_FILE=27000@flexlm-server-name
#ENV MLM_LICENSE_FILE=$LICENSE_SERVER

# Alternatively you can put a license file into the container.
# You should fill this file out with the details of the license
# server you want to use and uncomment the following line.
# COPY network.lic /opt/matlab/licenses/

# The following environment variables allow MathWorks to understand how this MathWorks
# product (MATLAB Dockerfile) is being used. This information helps us make MATLAB even better.
# Your content, and information about the content within your files, is not shared with MathWorks.
# To opt out of this service, delete the environment variables defined in the following line.
# See the Help Make MATLAB Even Better section in the accompanying README to learn more:
# https://github.com/mathworks-ref-arch/matlab-dockerfile#help-make-matlab-even-better
#ENV MW_DDUX_FORCE_ENABLE=true MW_CONTEXT_TAGS=MATLAB:DOCKERFILE:V1

RUN python3 -m pip install matlab-proxy

# install supervisord
RUN apt-get update && apt-get install -y supervisor
RUN mkdir -p /var/log/supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# configure script to create a dev URL
COPY ["configure", "/coder/configure"]
RUN chmod +x /coder/configure

# Set user and work directory
USER coder