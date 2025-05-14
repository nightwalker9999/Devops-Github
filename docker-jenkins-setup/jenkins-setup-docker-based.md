# 🛠️ Jenkins Setup (Docker Compose in GitPod)

## ✅ Objective

Set up a working, persistent Jenkins server in GitPod using Docker Compose, preparing it for future CI/CD pipelines.

---

## 🔧 What Was Done

- Created `docker-compose.yml` to define Jenkins container, port mappings, and volume.
- Used a **named volume** (`jenkins_home`) to persist Jenkins data like jobs, config, plugins.
- Exposed **port 8080** in GitPod for Jenkins web UI.
- Started Jenkins container using `docker-compose up -d`.
- Diagnosed and resolved **volume permission errors** caused by failed bind mount to `.jenkins_data` (due to GitPod FS restrictions).
- Switched back to Docker-managed **named volume**, which works seamlessly in GitPod.
- Retrieved Jenkins admin password using:
  ```bash
  docker exec devops_jenkins cat /var/jenkins_home/secrets/initialAdminPassword