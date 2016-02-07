# Mattermost Dockerfile
FROM ubuntu:14.04

RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt-get install -y wget

RUN wget https://github.com/mattermost/platform/releases/download/v1.4.0/mattermost.tar.gz
RUN tar -xvzf mattermost.tar.gz

RUN mkdir -p /mattermost/data

COPY config.json /mattermost/config/config.json

RUN touch /etc/init/mattermost.conf
COPY mattermost.conf /etc/init/mattermost.conf

COPY docker-entry.sh /
RUN chmod +x /docker-entry.sh
ENTRYPOINT /docker-entry.sh

EXPOSE 8065
