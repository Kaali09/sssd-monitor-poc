# syntax=docker/dockerfile:1
FROM ubuntu:latest
RUN apt-get update && apt-get install -y supervisor
RUN mkdir -p /var/log/supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY supervisor-event-to-slack /usr/local/bin/supervisor-event-to-slack
COPY  first_porcess.sh /usr/local/bin/echo.sh
CMD ["/usr/bin/supervisord"]
