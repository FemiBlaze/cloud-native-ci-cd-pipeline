# Containerized App with CI/CD on AWS ECS

## Overview

The project is a full end-to-end DevOps implementation that demonstrates how to:

* Containerize a frontend application using Docker
* Provision cloud infrastructure using Terraform
* Deploy containers to AWS ECS (Fargate)
* Automate deployments using GitHub Actions (CI/CD)

This project simulates a real-world DevOps workflow, from local development to cloud deployment with automation.

---

## Important Note

This application was built for testing and demonstration purposes only.

The login system uses hardcoded credentials
No backend or database is involved
Authentication is purely simulated on the frontend

## 🔐 Demo Users

| Name  | Username | Password |
|-------|----------|----------|
| Jane  | jane     | jane123  |
| Ken   | ken      | ken123   |
| Fredd | fredd    | fredd123 |

---

## Architecture

GitHub → GitHub Actions → Docker → ECR → ECS (Fargate) → ALB → Browser

Components

* Frontend App: Vite-based static app
* Docker: Multi-stage build (Node → Nginx)
* ECR: Stores container images
* ECS (Fargate): Runs containers serverlessly
* ALB: Exposes app publicly
* Terraform: Infrastructure provisioning
* GitHub Actions: CI/CD pipeline

---

## Tools & Technologies Used

|       Tool     | Purpose |
|----------------|---------|
| Terraform      | Infrastructure as Code |
| GitHub Actions | CI/CD automation |
| AWS EC2        | Compute |
| AWS VPC        | Networking |
| Nginx          | Web server |
| GitHub         | Source control |

---

## Project Structure

```bash
cloud-native-ci-cd-pipeline/
├── app/                     # Frontend application (Vite)
│   ├── index.html
│   ├── main.js
│   ├── styles.css
│   ├── package.json
│   └── package-lock.json
│
├── infra/                  # Terraform infrastructure
│   ├── provider.tf
│   ├── variables.tf
│   ├── iam.tf
│   ├── outputs.tf
│   ├── networking.tf
│   ├── security.tf
│   ├── ecs.tf
│   └── ecr.tf
│
├── .github/
│   └── workflows/
│       └── deploy.yml      # CI/CD pipeline
│
├── screenshots/            # Project screenshots
│   ├── app-dashboard.png
│   ├── app-login.png
│   ├── github-actions-run.png
│   ├── github-actions-overview.png
│   ├── ecr-repository.png
│   ├── ecs-service.png
│   └── terraform-apply.png
│
│
├── nginx.conf              # Nginx config (SPA routing fix)
├── Dockerfile
├── .gitignore
└── README.md
```

## 🐳 Docker Setup

The application is containerized using a **multi-stage build**:

- **Build stage** (Node.js)
- **Serve stage** (Nginx)

### Build Image
docker build -t foodie-app .

### Run Locally
docker run -p 8080:80 foodie-app

### Access
http://localhost:8080

---


## Terraform Infrastructure

Infrastructure is defined using Terraform and includes:

- ECS Cluster (Fargate)
- ECS Service
- Task Definition
- Application Load Balancer
- Target Group & Listener
- Security Group
- ECR Repository

### Initialize Terraform
terraform init

### Apply Infrastructure
terraform apply

---

## Terraform Outputs

After deployment, Terraform provides:

- App URL (Load Balancer DNS)
- ECR Repository URL
- ECS Cluster Name
- ECS Service Name
- Task Definition

These outputs are essential for:

* Debugging
* CI/CD integration
* Deployment verification

---

## CI/CD Pipeline (GitHub Actions)

The pipeline is triggered on:

push:
  branches: [ "main" ]

### Workflow Steps

1. Checkout code
2. Configure AWS credentials
3. Authenticate with ECR
4. Build Docker image
5. Tag image
6. Push to ECR
7. Force ECS deployment

---

### GitHub Secrets Required

- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`
- `AWS_REGION`
- `ECR_REGISTRY`

---

## Deployment Flow

Developer Push → GitHub Actions → Docker Build → ECR Push → ECS Update → Live App

---

## Key Learnings

1. Containerization with Docker
2. Infrastructure as Code with Terraform
3. AWS ECS (Fargate) deployment
4. Load balancing with ALB
5. CI/CD automation using GitHub Actions
6. DevOps workflow design

---

### Future Upgrades.

* Add HTTPS (ACM + ALB)
* Implement autoscaling
* Add backend service (Node/Go)
* Introduce environment separation (dev/staging/prod)
* Add monitoring (Prometheus + Grafana)

---

## Cleanup (IMPORTANT)

To avoid AWS charges:

Run terraform destroy

---

