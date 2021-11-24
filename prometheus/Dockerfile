FROM prom/prometheus:v2.31.1
ADD ./config.yml /etc/prometheus/config.yml
CMD [ "--config.file=/etc/prometheus/config.yml", "--storage.tsdb.path=/prometheus" ] 
