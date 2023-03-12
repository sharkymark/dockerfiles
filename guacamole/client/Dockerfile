#
# 2023-03-12 pushed to marktmilligan/guacamole:1.5.0
# 2023-03-12 pushed to marktmilligan/guacamole:1.4.0
# 2023-03-12 pushed to marktmilligan/guacamole:1.3.0
# 2023-03-12 pushed to marktmilligan/guacamole:1.2.0
# 2023-03-12 pushed to marktmilligan/guacamole:1.1.0
# 
# https://guacamole.apache.org/doc/0.9.7/gug/noauth.html
# https://guacamole.apache.org/releases/0.9.14/
# https://repo1.dso.mil/dsop/opensource/apache/guacamole/guacamole-client/-/issues/5
# https://github.com/coder/enterprise-images/blob/main/images/base/Dockerfile.ubuntu
# https://hub.docker.com/r/guacamole/guacamole/tags
#

# Dockerfile
FROM docker.io/guacamole/guacamole:1.5.0

# Run everything as root
USER root

# Copy config files
ENV GUACAMOLE_HOME=/etc/guacamole
COPY ["guacamole.properties", "/etc/guacamole/guacamole.properties"]
COPY ["user-mapping.xml", "/etc/guacamole/user-mapping.xml"]

# Set back to guacamole user
USER guacamole