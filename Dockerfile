FROM ubuntu:xenial

#Requirements
RUN apt-get update \
 && apt-get install -y --no-install-recommends apt-utils \
 && apt-get install -y --no-install-recommends cron \
 && apt-get clean && rm -rf /var/lib/apt/lists/*

#mount point
RUN mkdir -p /data

#copy the script to docker
COPY script.sh /root/script.sh

#copy crontab file to cron folder, and access rights
COPY crontab /etc/cron.d/mycron
RUN chmod 0644 /etc/cron.d/mycron

#initialize log file, and run run cron at boot
RUN touch /var/log/cron.log
ENTRYPOINT cron && tail -f /var/log/cron.log
