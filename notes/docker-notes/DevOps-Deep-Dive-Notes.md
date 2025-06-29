# DevOps Deep-Dive Notes

A living log of key concepts, examples & docs links.  
Each day’s deep dive goes in its own “Day X” section—append new sections at the **top** as you progress.

---

## 📚 Table of Contents

- [Day 1 — Docker Best Practices](#day-1--docker-best-practices)
- [Day 2 — (Add day’s topic here)](#day-2--add-days-topic-here)
- [How to Use](#how-to-use)

---

## Day 2 — (Add day’s topic here)

_(Copy the template below, rename to “Day X”, and paste your deep-dive notes, snippets & links.)_

---

## Day 1 — Docker Best Practices

### 1. Reorder & Leverage Cache  
```dockerfile
# Before optimization
COPY . /app
RUN pip install -r requirements.txt

# After optimization
COPY requirements.txt /app/
RUN pip install -r /app/requirements.txt
COPY . /app
```
**Why?** Placing rarely-changing files first maximizes layer reuse on subsequent builds, speeding up iterative CI/CD runs.

---

### 2. Multi-Stage Builds
```dockerfile
FROM golang:1.20 AS builder
WORKDIR /src
COPY . .
RUN go build -o myapp

FROM alpine:3.18
COPY --from=builder /src/myapp /usr/local/bin/
ENTRYPOINT ["myapp"]
```
**Why?** Removes compilers and build tools from the final image, keeping it lean and secure.

---

### 3. Pin Base Image by Digest
```dockerfile
FROM python@sha256:3a8f3…e5f2
```
**Why?** Ensures you always build against the exact same OS and runtime, avoiding unexpected drift and vulnerabilities.

---

### 4. Combine & Cache-Bust RUN
```dockerfile
RUN set -o pipefail && \
    apt-get update && \
    apt-get install -y curl && \
    rm -rf /var/lib/apt/lists/*
```
**Why?** Creates a single layer, always fetches fresh packages, and avoids stale cache issues.

---

### 5. Enforce Fail-Fast in Pipes
```dockerfile
RUN set -o pipefail && wget http://example.com/file | tee /tmp/log
```
**Why?** Guarantees the build fails if any piped command errors, preventing silent failures.

---

### 6. JSON-Form CMD
```dockerfile
CMD ["python", "app.py"]
```
**Why?** Avoids shell-wrapping issues and makes it easier to override the command at runtime.

---

### References
- [Dockerfile Best Practices](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#leverage-build-cache)
- [Docker Build Reference](https://docs.docker.com/engine/reference/builder/#docker-build-caching)

---

## How to Use

- **New Day?**  
  Copy the “Day X” template, rename to your new day, and paste your notes at the very top of this file.
- **Add to Table of Contents**  
  Include your new day and topic for easy navigation.
- **Keep learning and building!**