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

printf "So far so good, let me see you now. \njenkins-master docker image you say?\n"
# ok let's build some images for jenkins-master and jenkins-slave server
docker build -t jenkins-master:stable ./jenkins-master | tee jenkins-master_$(date +%s).log
if [ "$?" != "0" ]; then
  printf "Check if all is ok with jenkins-master before continue\n"
  exit 1
else
  printf "jenkins-master:stable image ready\n"
docker image ls | grep jenkins-master
fi

printf "Nice progress. \njenkins-slave docker image, peace of cake?\n"
docker build -t jenkins-slave:stable ./jenkins-slave | tee jenkins-slave_$(date +%s).log
if [ "$?" != "0" ]; then
  printf "Check if all is ok with jenkins-slave before continue \n"
  exit 1
else
  printf "jenkins-slave:stable image ready \n"
docker image ls | grep jenkins-slave
fi


mkdir -p ~/jenkins-{master,slave}_home
cp -R ./jobs/* ~/jenkins-master_home/jobs/

docker-compose -f ./docker-compose.ci.yml up &

