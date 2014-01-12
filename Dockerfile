FROM ubuntu:precise
#Thanks to https://github.com/bydavy/docker-plex/blob/master/Dockerfile and https://github.com/aostanin/docker-plex/blob/master/Dockerfile
MAINTAINER Tim Haak <tim@haak.co.uk>
RUN apt-get -q update

#ENV LANG en_US.UTF-8

RUN apt-get install -qy --force-yes curl

RUN echo "deb http://shell.ninthgate.se/packages/debian squeeze main" > /etc/apt/sources.list.d/plexmediaserver.list

RUN curl http://shell.ninthgate.se/packages/shell-ninthgate-se-keyring.key | apt-key add -

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 43525C28E533491A
RUN apt-get -q update

RUN apt-get install -qy --force-yes plexmediaserver

VOLUME /config
VOLUME /data

ADD ./start.sh /start.sh
RUN chmod u+x  /start.sh

EXPOSE 32400

ENTRYPOINT ["/start.sh"]
