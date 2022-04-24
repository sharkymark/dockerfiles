FROM codercom/enterprise-base:ubuntu

# Run everything as root
USER root

# configure script
COPY ["configure", "/coder/configure"]
RUN chmod +x /coder/configure

# copy workspace apps info (config.yaml)
COPY ["./coder", "/coder"]

# install Apache Airflow
RUN echo n | pip3 install apache-airflow

# Set back to coder user
USER coder

