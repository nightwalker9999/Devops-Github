# 🚀 Jenkins Setup on DigitalOcean (Docker-Based)

## 📅 Date: [Your Date Here]
## 💻 System: DigitalOcean Ubuntu 22.04 Droplet
## 🎯 Objective: Install Docker & Run Jenkins as a Container with Persistent Storage

---

## **1️⃣ Install Docker on DigitalOcean**

### **Update System & Install Docker**
```sh
sudo apt update && sudo apt install -y docker.io
```

### **Verify Installation**
```sh
docker --version
```

### **Allow Running Docker Without `sudo`**
```sh
sudo usermod -aG docker $USER
```

### **Log Out & Log Back In** (Needed for group changes to take effect)

### **Check Docker Status**
```sh
docker ps
```

---

## **2️⃣ Create a Custom Docker Network**
```sh
docker network create jenkins
```

---

## **3️⃣ Run Docker-in-Docker (DinD) for Jenkins to Use**
```sh
docker run \
  --name jenkins-docker \
  --detach \
  --privileged \
  --network jenkins \
  --network-alias docker \
  --env DOCKER_TLS_CERTDIR= \
  --publish 2375:2375 \
  --restart unless-stopped \
  docker:dind
```

---

## **4️⃣ Run Jenkins as a Persistent Container**
```sh
docker run \
  --name jenkins \
  --detach \
  --network jenkins \
  --env DOCKER_HOST=tcp://docker:2375 \
  --publish 8080:8080 \
  --publish 50000:50000 \
  --restart unless-stopped \
  jenkins/jenkins:lts
```

---

## **5️⃣ Retrieve Jenkins Admin Password**
```sh
docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
```
Copy this password and log in to **Jenkins UI**.

### **Access Jenkins UI**
Open in browser:
```
http://your-public-ip:8080
```

---

## **6️⃣ Firewall & Network Fixes (If Needed)**

If Jenkins is not accessible, allow firewall ports:
```sh
sudo ufw allow 8080/tcp
sudo ufw allow 50000/tcp
sudo ufw reload
```

---

## **7️⃣ Auto-Restart Jenkins After Reboot**
If Jenkins does not restart automatically, enable persistent restart:
```sh
docker update --restart unless-stopped jenkins jenkins-docker
```

---

## **🎯 Final Outcome**
✅ **Jenkins is now running inside Docker**.  
✅ **Jenkins and its data persist after reboot**.  
✅ **Auto-restart is configured for future use**.  

🚀 **Setup complete! Ready for DevOps automation!** 🎯🔥

