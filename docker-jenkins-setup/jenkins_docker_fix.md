# Quick Fix: “503 on /login” for Jenkins in Gitpod

When Jenkins is stuck behind Gitpod’s proxy (showing a 503), follow these steps:

---

## 1. Tear down any old Jenkins container & volume

```bash
cd path/to/your-repo/jenkins
docker-compose down --volumes --remove-orphans

# If a leftover volume still appears, remove it manually:
docker volume ls               # locate the “jenkins_data” volume name or hash
docker volume rm <that_volume>


## 2. Fix for Pipeline and other plugins not present
We were building the service using the jenkins image, not our directory one
So changed 
services:
  jenkins:
    build: jenkins/jenkins:lts-jdk11 to 

jenkins:
    build: .   

To persist across new gitpod sessions, we use bind mount like this
version: "3.8"

services:
  jenkins:
    build: .
    ports:
      - "8080:8080"
    environment:
      - JAVA_OPTS=-Djenkins.install.runSetupWizard=false
      - JENKINS_OPTS=--httpListenAddress=0.0.0.0 --prefix=/
      - JENKINS_ADMIN_ID=admin
      - JENKINS_ADMIN_PASSWORD=admin
    volumes:
      - jenkins_home:/var/jenkins_home

volumes:
  jenkins_home:
    driver: local

    