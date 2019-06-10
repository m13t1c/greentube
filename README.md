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


### jenkins creds
- user: jenkins
- pass: jenkins

### how to start scritp

### docker hub login

### mailsetup

1. Manage Jenkins -> Configure System -> E-mail Notification
2. Click on Advance button as well to get other important option

- SMTP server: 
- Use SMTP Authentication 
  - User name:
  - Password:

3.  Test configuration by sending test e-mail
  - Test e-mail recipient
    - Test configuration button


