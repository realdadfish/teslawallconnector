FROM prom/prometheus:v2.31.1
ADD ./config.yml /etc/prometheus/config.yml
# Keep historical time series for three years (default: 15d)
CMD [ "--config.file=/etc/prometheus/config.yml", "--storage.tsdb.path=/prometheus", "--storage.tsdb.retention.time=3y"]
