# 🚀 Flask App Deployment with Docker - Daily Learning Log

## 📅 Date:23 Feb 2025

---

## **🔹 Learning Summary - Key Takeaways**
✅ **Python & Flask Setup** on DigitalOcean Droplet.  
✅ **Created a Basic Flask App** and tested it locally.  
✅ **Containerized the Flask App** using Docker.  
✅ **Ran Flask inside a Docker Container** with proper networking.  
✅ **Fixed Common Docker Issues**, including missing dependencies.  
✅ **Ensured Flask listens on `0.0.0.0`** for external access.  
✅ **Configured Auto-Restart for Docker Containers.**  
✅ **Removed `venv` from Git Tracking** and added to `.gitignore`.  

---

## **1️⃣ Flask App Setup on DigitalOcean**

### **Update System & Install Python**
```sh
sudo apt update && sudo apt install -y python3 python3-pip
```

### **Create a Virtual Environment & Install Flask**
```sh
mkdir ~/flask-app && cd ~/flask-app
python3 -m venv venv
source venv/bin/activate
pip install flask
```

### **Create a Basic Flask App**
```sh
nano app.py
```
Paste:
```python
from flask import Flask

app = Flask(__name__)

@app.route('/')
def home():
    return "Hello, DevOps Engineer!"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
```
Save and exit (`CTRL + X`, then `Y`, then `Enter`).

### **Run the Flask App**
```sh
python app.py
```
Verify locally:
```sh
curl http://127.0.0.1:5000
```

---

## **2️⃣ Containerizing the Flask App with Docker**

### **Create a Dockerfile**
```sh
nano Dockerfile
```
Paste:
```dockerfile
FROM python:3.9-slim
WORKDIR /app
COPY . .
RUN pip install --no-cache-dir flask requests
EXPOSE 5000
CMD ["python", "app.py"]
```
Save and exit.

### **Build & Run the Docker Container**
```sh
docker build -t flask-app .
docker run -d -p 5000:5000 --name flask-container flask-app
```

### **Check Running Containers**
```sh
docker ps
```
Test in browser:
```
http://your-public-ip:5000
```

### **Ensure Flask Container Auto-Restarts**
```sh
docker update --restart unless-stopped flask-container
```

---

## **3️⃣ Removing `venv` from Git Tracking**

### **Remove `venv` from Git Cache**
```sh
git rm -r --cached venv
```

### **Add `venv` to `.gitignore`**
```sh
echo "venv/" >> .gitignore
git add .gitignore
git commit -m "Added venv to .gitignore"
```

### **Rollback Staged Changes if Needed**
```sh
git reset HEAD .
```

### **If You Already Committed and Want to Undo**
```sh
git reset --soft HEAD~1
```

### **Verify & Push Changes**
```sh
git status
git push origin main
```

---

## **🎯 Final Outcome**
✅ **Flask App is running inside a Docker container.**  
✅ **Persistent setup with auto-restart enabled.**  
✅ **Git repo cleaned with `venv` removed from tracking.**  

🚀 **Ready for CI/CD automation with Jenkins!** 🎯🔥

