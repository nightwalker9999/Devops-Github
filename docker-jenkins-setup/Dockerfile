FROM jenkins/jenkins:lts-jdk11

ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"

RUN jenkins-plugin-cli --plugins workflow-aggregator git docker-workflow credentials-binding matrix-auth

