FROM python:3.9-slim
COPY start.py .
RUN pip3 install prometheus_client requests
EXPOSE 9225
CMD ["/usr/local/bin/python3", "./start.py"]
