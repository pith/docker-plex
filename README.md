plex
====

This is a Dockerfile to set up (https://plex.tv/ "Plex Media Server") - (https://plex.tv/)

Build from docker file

git clone git@github.com:timhaak/docker-plex.git
cd docker-plex
docker build -t plex .

docker run -d -h *<your host name>* -v /*<your config location>*:/config -v /*<your videos location>*:/data -p 32400:32400  plex
