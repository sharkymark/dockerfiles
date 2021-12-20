FROM codercom/enterprise-base:ubuntu

# Run everything as root
USER root

# Install ClickHouse: 
RUN curl -O 'https://builds.clickhouse.com/master/amd64/clickhouse' && chmod a+x ./clickhouse

# copy configure script to coder folder in container
COPY [ "configure", "/coder/configure" ]

# Set back to coder user
USER coder