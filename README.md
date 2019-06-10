### SETUP Jenkins multibranch pipeline
1. As normal user (!root) launch setup.sh script.
2. setup.sh will do:
  - check if docker cli installed
  - check if user not root
  - build jenkins-master server from public "jenkins/jenkins:lts"
  - tag it as stable localy, if build succesed (jenkins-master:stable)
  - output log file in current directory
  - build jenkins-slave server based on public "ubuntu:16.04"
  - tag it as stable localy, if build succesed (jenkins-slave:stable)
  - output log file in current directory
  - prepare greentube_app_multibranch-pipeline job 
  - bring up jenkins-master/slave with docker-compose using docker-compose.ci.yml

#### There is some manual steps, mostly beceause of security (e-mail user pass for jenkins mail send configuraiont; docker Hub login need to be done on jenkins-slave instance initialy)

### jenkins creds
- user: jenkins
- pass: jenkins

### mailsetup

1. Manage Jenkins -> Configure System -> E-mail Notification
2. Click on Advance button as well to get other important option

- SMTP server: 
- Use SMTP Authentication 
  - User name: noreply@yourdomain.com
  - Password: ************

3.  Test configuration by sending test e-mail
  - Test e-mail recipient
    - Test configuration button

### docker hub
- CONTAINER_ID=`docker ps | grep jenkins-slave | awk '{print $1}'`
- docker exec -ti ${CONTAINER_ID} /bin/bash
  - docker login
    - Login with your Docker ID to push and pull images from Docker Hub. If you don't have a Docker ID, head over to https://hub.docker.com to create one.
      - Username: your_docker_hub_user
      - Password: ********************
    - WARNING! Your password will be stored unencrypted in /root/.docker/config.json.
    Configure a credential helper to remove this warning. See
    https://docs.docker.com/engine/reference/commandline/login/#credentials-store

    Login Succeeded

   
