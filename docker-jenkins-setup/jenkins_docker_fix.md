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
