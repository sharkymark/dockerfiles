FROM mathworks/matlab:r2022a

USER root

# install supervisord
RUN apt-get update && apt-get install -y supervisor
RUN mkdir -p /var/log/supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# configure script to create a dev URL and launch Matlab
COPY ["configure", "/coder/configure"]
RUN chmod +x /coder/configure

# copy workspace apps info (config.yaml)
COPY ["./coder", "/coder"]

USER matlab