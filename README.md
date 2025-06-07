## 🚀 E-Learning Platform Deployment Guide (AWS + DevOps)

This project demonstrates how to deploy a React and Node.js-based e-learning platform on AWS using DevOps practices and tools: **Docker, Jenkins, Kubernetes, Helm**, and monitoring tools like **Prometheus** and **Grafana**, along with security scanning using **OWASP Dependency Check**, **SonarQube**, and **Trivy**.

---

### 📁 Project Structure
```
.
├── frontend/                  # React App
│   └── Dockerfile
├── backend/                   # Node.js Backend
│   └── Dockerfile
├── k8s/                       # Kubernetes YAML Files
├── helm/e-learning/           # Helm Chart for App
├── Jenkinsfile                # CI/CD Pipeline
└── README.md                  # This file
```

---

## Installation

1. Clone the repository:

```bash
https://github.com/Sai-Chakradhar-Mahendrakar/Elearning-Platform-Using-MERN.git
```

2. Navigate to the project directory:

```bash
cd Elearning-Platform-Using-MERN
```

3. Install dependencies for the server:

```bash
cd backend
npm install
```

4. Navigate to the client directory and install client dependencies:

```bash
cd frontend
npm install
```

5. Run Frontend:

```bash
cd frontend
npm start
```

6. Run Backend:

```bash
cd backend
node index.js
```

The application will be accessible at `http://localhost:3000`.

### 🐳 Docker Image Build (Manual)
```bash
# Frontend
cd frontend
docker build -t yourdockerhub/frontend:latest .

# Backend
cd ../backend
docker build -t yourdockerhub/backend:latest .
```

### 🔐 Scan Images
```bash
# File system scan with Trivy
trivy fs ./frontend > frontend-trivy.txt
trivy fs ./backend > backend-trivy.txt
```

### 🧪 Code Quality
```bash
# SonarQube scan (run inside Jenkins or manually)
npx sonar-scanner \
  -Dsonar.projectKey=backend \
  -Dsonar.sources=. \
  -Dsonar.host.url=http://<SONARQUBE_URL> \
  -Dsonar.login=<TOKEN>

# OWASP Dependency Check (Docker)
docker run --rm -v $(pwd):/src -v $(pwd)/odc:/report owasp/dependency-check --project "e-learning" --scan /src/backend --out /report --format HTML
```

---

### 🛠️ Helm Deployment (If Using Helm)
```bash
cd helm/e-learning
helm install elearn .
```

### ☸️ Kubernetes Deployment (Without Helm)
```bash
# Create monitoring namespace
kubectl create namespace monitoring

# Apply monitoring stack
kubectl apply -f k8s/prometheus-config.yaml
kubectl apply -f k8s/prometheus-deployment.yaml
kubectl apply -f k8s/prometheus-service.yaml
kubectl apply -f k8s/grafana-deployment.yaml
kubectl apply -f k8s/grafana-service.yaml

# Apply application stack
kubectl apply -f k8s/frontend-deployment.yaml
kubectl apply -f k8s/frontend-service.yaml
kubectl apply -f k8s/backend-deployment.yaml
kubectl apply -f k8s/backend-service.yaml
kubectl apply -f k8s/ingress.yaml
```

---

### 📊 Monitoring
- Prometheus UI: `http://<NodeIP>:<NodePort>/`
- Grafana UI: `http://<NodeIP>:3000`
  - Default login: `admin/admin`

---

### 📦 Jenkins Setup (CI/CD)
1. Install required plugins:
   - Docker, Kubernetes CLI, Git, NodeJS, SonarQube Scanner, Trivy (CLI)
2. Configure Jenkins Credentials:
   - DockerHub (`dockerhub-creds`)
   - SonarQube (`SonarQubeServer`)
3. Create a pipeline project pointing to your `Jenkinsfile`.

---

### ✅ Final Tips
- Make sure Docker images are pushed to DockerHub or ECR.
- Kubernetes cluster should be provisioned (EKS preferred on AWS).
- Use a reverse proxy like NGINX Ingress for domain-based routing.

---

Happy Learning! 🎓

