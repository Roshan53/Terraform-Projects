# 🚀 Containerized Application Deployment on Amazon EKS using Terraform, Docker & GitHub Actions

## 📌 Project Overview

This project demonstrates a **production-style CI/CD pipeline** to deploy a containerized application on **Amazon EKS (Kubernetes)** using:

- **Terraform** for infrastructure provisioning
- **Docker** for containerization
- **Amazon ECR** for image storage
- **GitHub Actions** for CI/CD automation
- **Kubernetes (EKS)** for container orchestration

The application is automatically built, pushed, and deployed to EKS whenever code is updated.

---

## 🧠 Architecture

![architecture diagram](<architecture diagram.png>)

---

## ⚙️ Tech Stack

| Category | Tools Used |
|--------|------------|
| Cloud | AWS (EKS, ECR, VPC, IAM) |
| IaC | Terraform |
| Containerization | Docker |
| CI/CD | GitHub Actions |
| Orchestration | Kubernetes (EKS) |
| Application | Python Flask |

---

## 📁 Project Structure

```text
eks-terraform-cicd-app/
├── app/
│   ├── app.py
│   ├── requirements.txt
│   └── Dockerfile
├── terraform/
├── k8s/
├── .github/workflows/
└── screenshots/


🚀 Features

Provisioned EKS cluster and networking using Terraform
Containerized application using Docker
Stored images in Amazon ECR
Implemented CI/CD pipeline using GitHub Actions
Deployed application using Kubernetes Deployment & Service
Enabled rolling updates
Exposed application via AWS LoadBalancer


🔄 CI/CD Workflow

Developer pushes code to GitHub
GitHub Actions pipeline triggers
Docker image is built
Image is pushed to Amazon ECR
Kubernetes deployment is updated
New pods are created (rolling update)


🌐 Application Access

The application is exposed via:

http://<AWS-LoadBalancer-DNS>

Health check:

/health


🛠️ Setup Instructions

1️⃣ Clone Repository
git clone https://github.com/YRoshan53/Terraform-Projects/eks-terraform-cicd-app.git

cd eks-terraform-cicd-app

2️⃣ Deploy Infrastructure
cd terraform
terraform init
terraform apply -auto-approve

3️⃣ Configure kubectl
aws eks update-kubeconfig --region ap-south-1 --name <cluster-name>

4️⃣ Deploy Application (Manual - first time)
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml

5️⃣ CI/CD Deployment

Push code changes:

git add .
git commit -m "update app"
git push

GitHub Actions will:

Build Docker image
Push to ECR
Deploy to EKS


📊 Kubernetes Commands Used

kubectl get nodes
kubectl get pods
kubectl get svc
kubectl rollout status deployment/flask-app
kubectl logs <pod-name>


🔥 Key Learnings
Hands-on with EKS cluster setup
Understanding of Kubernetes core concepts
Building real CI/CD pipelines
Working with Docker & ECR
Infrastructure automation using Terraform
Deploying scalable apps in cloud


🚀 Future Improvements
Implement Ingress Controller
Add Helm charts
Setup Auto Scaling (HPA)
Add Monitoring (Prometheus + Grafana)
Implement ArgoCD (GitOps)


👨‍💻 Author

Roshan K
Cloud & DevOps Engineer (Aspiring)