FROM codercom/enterprise-base:ubuntu

# Run everything as root
USER root

# configure script
COPY ["configure", "/coder/configure"]
RUN chmod +x /coder/configure

# install Apache Airflow
RUN pip3 install apache-airflow

# install Pandas, Numpy
RUN pip3 install pandas && \
    pip3 install numpy

# install supervisord
RUN apt-get update && apt-get install -y supervisor
RUN mkdir -p /var/log/supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Set back to coder user
USER coder

