FROM jenkins/jenkins:lts

RUN /usr/local/bin/install-plugins.sh git mstest matrix-auth workflow-aggregator docker-workflow blueocean credentials-binding maven email-ext

ENV JENKINS_USER jenkins
ENV JENKINS_PASS jenkins

# Skip initial setup
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

COPY executors.groovy /usr/share/jenkins/ref/init.groovy.d/
COPY default-user.groovy /usr/share/jenkins/ref/init.groovy.d/
RUN mkdir /var/jenkins_home/jobs/greentube_app
COPY greentube_app_job.xml /var/jenkins_home/jobs/greentube_app/config.xml

VOLUME /var/jenkins_home
