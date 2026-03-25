#  AWS Multi-Tier Architecture using Terraform

This project demonstrates provisioning of a **scalable and secure multi-tier architecture on AWS using Terraform**.

---

#  Architecture Overview

This project follows a **3-tier architecture**:

*  Web Tier → Application Load Balancer (ALB)
*  Application Tier → EC2 instances (Auto Scaling Group)
*  Database Tier → RDS MySQL

# Technologies Used

* AWS (VPC, EC2, ALB, ASG, RDS)
* Terraform
* Nginx
* Git & GitHub

---

# Project Structure

```
multi-tier-architecture-using-terraform/
├── compute.tf
├── database.tf
├── network.tf
├── security.tf
├── variables.tf
├── providers.tf
├── versions.tf
├── outputs.tf
├── templates/
├── screenshots/
├── README.md
└── .gitignore
```

---

# How to Run

```bash
terraform init
terraform validate
terraform plan
terraform apply
```

---

# 🌐 Access Application

After deployment:

```
http://<alb_dns_name>
```

---

# Security

* ALB → open to internet (port 80)
* EC2 → only accessible from ALB
* RDS → only accessible from EC2
* App & DB are in private subnets

---

# What I Learned

* Built 3-tier AWS architecture using Terraform
* Used Auto Scaling + Load Balancer
* Designed secure VPC with public/private subnets
* Fixed AMI issue using SSM Parameter
* Implemented IMDSv2 metadata

---

# Cleanup

```bash
terraform destroy
```

---

# Author

Roshan Kothalakkal
