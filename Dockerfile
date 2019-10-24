FROM ubuntu:latest

MAINTAINER btassone <brandontassone@gmail.com>

COPY docker-entrypoint.sh /usr/local/bin/

RUN apt-get update && \
apt-get upgrade

RUN apt-get install curl -y && \
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

ENTRYPOINT ["docker-entrypoint.sh"]
