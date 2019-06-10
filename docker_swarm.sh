#!/bin/bash

# some pre-check
printf "Check user before start: \n"
if [ "$UID" = "0" ]; then
  printf "WTF !!!?\n"
  printf "https://docs.slackware.com/slackware:beginners_guide#post_installation_overview \n"
  exit 1
else
  printf "Thanks to Cloud, your are not root, please proceed.\n"
fi

printf "\n"

printf "Check if basic tools satify our needs\n"
if ! [ -x "$(command -v docker)" ]; then
  printf "Yo, where you go without tool :), please install docker first.\n"
  printf "https://www.docker.com/get-started \n"
  exit 1
else
  printf "Yor already have docker, good for you ;)\n"
fi

printf "\n"


docker swarm init
docker stack deploy --compose-file=docker-stack.yml greentube
