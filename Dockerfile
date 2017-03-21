# Mattermost Dockerfile
#FROM ubuntu:14.04
FROM armhfbuild/debian

ADD https://github.com/mattermost/platform/releases/download/v2.1.0-rc1/mattermost.tar.gz /mattermost.tar.gz
RUN tar -xvzf /mattermost.tar.gz; rm -f /mattermost.tar.gz

RUN mkdir -p /mattermost/data

COPY config.json /mattermost/config/config.json

RUN touch /etc/init/mattermost.conf
COPY mattermost.conf /etc/init/mattermost.conf

COPY docker-entry.sh /
RUN chmod +x /docker-entry.sh
ENTRYPOINT /docker-entry.sh

EXPOSE 8065
