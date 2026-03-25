# 🚀 AWS Application Load Balancer with Auto Scaling using Terraform

## 📌 Project Overview

This project demonstrates a **highly available, fault-tolerant, and auto-scalable web application architecture on AWS** using Terraform.

It leverages an **Application Load Balancer (ALB)** to distribute traffic across multiple EC2 instances managed by an **Auto Scaling Group (ASG)**. The system automatically scales based on CPU utilization using **CloudWatch alarms and scaling policies**.

---

## 🏗️ Architecture

![architecture diagram](<architecture diagram.png>)

User → Application Load Balancer → Target Group → Auto Scaling Group → EC2 Instances (Multi-AZ)

### Key Components:

* **Application Load Balancer (ALB)** – Distributes incoming traffic
* **Target Group** – Routes traffic to healthy instances
* **Auto Scaling Group (ASG)** – Maintains and scales EC2 instances
* **Launch Template** – Defines EC2 configuration
* **CloudWatch Alarms** – Monitors CPU and triggers scaling
* **Security Groups** – Controls network access

---

## ⚙️ Features

* ✅ High Availability across multiple Availability Zones
* ✅ Load balancing using ALB
* ✅ Health checks using `/health.html`
* ✅ Auto Scaling based on CPU utilization
* ✅ Self-healing infrastructure (auto replacement of failed instances)
* ✅ Infrastructure as Code using Terraform
* ✅ Secure architecture with layered security groups

---

## 📊 Scaling Configuration

| Type      | Condition               | Action       |
| --------- | ----------------------- | ------------ |
| Scale-Out | CPU > 70% for 2 minutes | +2 instances |
| Scale-In  | CPU < 30% for 5 minutes | -1 instance  |

---

## 📁 Project Structure

```
aws-elb-autoscaling-terraform/
├── provider.tf
├── variables.tf
├── terraform.tfvars
├── main.tf
├── outputs.tf
├── userdata.sh
├── README.md
└── screenshots/
```

---

## 🧰 Technologies Used

* **AWS Services**

  * EC2
  * Application Load Balancer
  * Auto Scaling Group
  * CloudWatch
  * VPC (default)
  * Security Groups

* **Tools**

  * Terraform
  * Git & GitHub

---

## 🚀 Deployment Steps

### 1. Clone the repository

```bash
git clone <repo-url>
cd aws-elb-autoscaling-terraform
```

### 2. Configure variables

Edit `terraform.tfvars`:

```hcl
key_name = "your-keypair-name"
my_ip    = "YOUR_PUBLIC_IP/32"
```

---

### 3. Initialize Terraform

```bash
terraform init
```

---

### 4. Validate configuration

```bash
terraform validate
```

---

### 5. Preview infrastructure

```bash
terraform plan
```

---

### 6. Deploy infrastructure

```bash
terraform apply
```

Type:

```bash
yes
```

---

## 🌐 Access the Application

After deployment, Terraform outputs:

```bash
alb_url = http://<alb-dns>
```

Open it in your browser.

---

## 🧪 Testing the System

### 🔹 Load Balancer Test

* Refresh the ALB URL multiple times
* Requests are distributed across instances

---

### 🔹 High Availability Test

* Terminate one EC2 instance manually
* ASG automatically launches a replacement

---

### 🔹 Scale-Out Test

Generate load:

```bash
ab -n 10000 -c 100 http://<alb-dns>/
```

Expected:

* CPU increases
* CloudWatch alarm triggers
* New instances are launched

---

### 🔹 Scale-In Test

* Stop load generation
* Wait for CPU to drop
* Instances scale down to minimum capacity

---

## 🔐 Security Design

* ALB allows HTTP from internet (`0.0.0.0/0`)
* EC2 allows HTTP only from ALB security group
* SSH access restricted to administrator IP
* Instances are not directly exposed to public traffic

---

## 📸 Screenshots (Add in `/screenshots` folder)

* Terraform apply success
* ALB configuration
* Target group healthy instances
* Auto Scaling Group details
* CloudWatch alarms
* Browser output
* Scale-out event
* Instance replacement
* Scale-in event

---

## 🧹 Cleanup (Important)

To avoid AWS charges:

```bash
terraform destroy
```

Type:

```bash
yes
```

---

## 🎯 Learning Outcomes

* Designed highly available AWS architecture
* Implemented load balancing and health checks
* Configured Auto Scaling with CloudWatch
* Automated infrastructure using Terraform
* Built self-healing and scalable system

---
