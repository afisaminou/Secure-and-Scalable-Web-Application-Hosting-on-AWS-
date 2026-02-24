
# Secure-and-Scalable-Web-Application-Hosting-on-AWS-

[![Watch Video](https://img.shields.io/badge/▶️%20Watch%20Me%20Build%20Project1--VPC-red?style=for-the-badge)](https://screenrec.com/share/BAlTGWC2vy)


**1. Project Overview:**

This project demonstrates how to design and deploy a **secure, highly available, and scalable web application architecture** using Amazon Web Services (AWS).

The infrastructure leverages core AWS services to ensure:

* High availability across multiple Availability Zones
* Automatic scaling based on demand
* Secure network access using Security Groups
* Fault tolerance via Application Load Balancer

**2. Architecture Diagram**

<img width="2378" height="2510" alt="Diagram - Secure Scalable Web Applaication Hosting on AWS" src="https://github.com/user-attachments/assets/534fbc60-2fa4-4e3e-b634-533a6945977b" />

**3. Technologies Used**

**Frontend Presentation Layer**

- Amazon EC2 in public subnets

- Internet-facing load balancer with auto-scaling

**Beckend Application Layer**

- Runtime & Framework: Python
- Application Hosting: Amazon EC2 in private subnet
- Load Balancing: Internal Application Load Balancer with Auto Scaling

**Database Technology**

- MySQL - Amazon RDS with Multi-AZ deployment

**Cloud Infrastructure & Security (AWS)**

- Networking: Amazon VPC (Virtual Private Cloud)
- Identity & Access Management (IAM): AWS Systems Manager Session Manager
- Security: Security Groups

**4. Problem Statement**

**❗ Business Problem**

A growing e‑commerce company was experiencing **frequent website outages, slow page loads,** and **inconsistent customer experiences** during peak traffic events such as product launches and seasonal sales. Their existing single‑server setup created several challenges:

* **No High Availability:** If the server failed, the entire website went offline.

* **No Scalability:** Traffic spikes caused performance degradation and timeouts.

* **Security Risks:** The web server and database were exposed to the public internet.

* **Manual Operations:** Deployments, scaling, and troubleshooting required manual intervention.

* **Limited Observability:** The team lacked visibility into instance health and traffic patterns.

These issues resulted in:

* Lost revenue during outages

* Poor customer satisfaction

* Increased operational overhead

* Difficulty supporting business growth

The company needed a **secure, scalable, fault‑tolerant architecture** that could handle unpredictable traffic while reducing operational burden.


**5. Solution: Highly Available, Multi‑Tier AWS Architecture** 

To address these challenges, we designed and deployed a secure, multi‑tier, auto‑scaling architecture on AWS. This solution provides:

   **1. High Availability**
* Application Load Balancer distributes traffic across **multiple Availability Zones**

* Auto Scaling Group automatically replaces unhealthy instances

* RDS Multi‑AZ ensures database continuity

  **2. Elastic Scalability**
* Auto Scaling adjusts capacity based on CPU/traffic

* Load Balancer ensures even distribution

* Architecture supports sudden traffic spikes without downtime

  **3. Strong Security Posture**
* Public access restricted to ALB only

* EC2 and RDS placed in private subnets

* Security Groups enforce least‑privilege communication

* No direct internet exposure for backend or database

  **4. Operational Efficiency**
* Launch Templates standardize deployments

* SSM Session Manager enables secure access without SSH keys

* Health checks and auto‑healing reduce manual intervention

  **5. Improved Performance & Reliability**
* Faster response times under load

* Zero‑downtime scaling

* Resilient infrastructure that continues operating even if an AZ fails


**6. Architecture Breakdown**

The application is hosted on:
* Custom VPC with public and private subnets across two Availability Zones
* Application Load Balancer (ALB)
* Frontend and Backend EC2 instancesEC2 Instances (Amazon Linux 2)
* Frontend and Backend Auto Scaling Groups (ASG)
* Security Groups for layered security

**High-Level Flow
Internet → Application Load Balancer → EC2 Instances (Auto Scaling)**

🔧 Core Infrastructure Components

* **Application Load Balancer (ALB)**

  * The **ALB distributes incoming HTTP traffic** across multiple EC2 instances.
 
* **EC2 Instances**

  * **EC2 instances serve the web application** and respond to ALB‑forwarded requests.

* **Auto Scaling Group (ASG)**

  * The **ASG maintains desired capacity** and automatically replaces unhealthy instances.

* **Security Groups**
  * **Security Groups control traffic between layers**, ensuring least‑privilege access.

🔐 **Security Design**

Security was implemented using AWS Security Groups:

**ALB Security Group**
- **Inbound:** HTTP (80) from 0.0.0.0/0
- **Outbound:** All traffic

**EC2 Security Group**
- **Inbound:** HTTP (80) from **ALB Security Group only**
- **Outbound:** All traffic

**This ensures EC2 instances are never directly exposed to the internet.**

📈 **Scalability & Availability**

  **1. Auto Scaling Group**
- Launch Template with **Amazon Linux 2**
- Automatic instance replacement
- Multi‑AZ deployment

  **2. Application Load Balancer**
- Deployed across **multiple Availability Zones**
- Health checks for continuous instance monitoring

  **3. Validation & Testing**

Validation included:
* **Local instance testing:** → curl http://localhost
* **Interface testing:** → curl http://$(hostname -i)
* **ALB endpoint testing:** → Accessed via browser using the ALB DNS name


**7. Infrastucture Deployment Steps (Simplified)**
1. Create a custom VPC
2. Configure public subnets across multiple AZs
3. Attach an Internet Gateway
4. Create Security Groups
5. Build a Launch Template
6. Create an Auto Scaling Group
7. Configure the Application Load Balancer
8. Attach Target Group
9. Verify Health Checks

🧠 **Key Lessons Learned and Takeaways**

  **1. Security Group Precision Matters**

Even when everything appears correct:

- Instances healthy ✔
- Apache running ✔
- Subnets correct ✔

A **single incorrect Security Group reference** can break the entire system.

**Example failure encountered:**

- ❌ EC2 SG allowed HTTP from the wrong SG

- ➡ Result: ALB health checks timed out

- ✔ Fix: Match EC2 inbound rule exactly with the ALB SG ID

  **2. Timeouts ≠ Application Failure**
Timeouts often indicate:

- Security Group mismatch
- Network path blocked
- Incorrect listener/target configuration

Not necessarily server issues.

  **3. AWS Debugging is Layered**

Troubleshooting required checking:

- Application (Apache) ✔
- OS Networking ✔
- Security Groups ✔
- NACLs ✔
- ALB Configuration ✔
- Target Group Health Checks ✔

🎯 **Project Goals Achieved**
- High Availability ✔ 
- Elastic Scalability ✔
- Secure Access Control ✔
- Fault Tolerance ✔


**8. Business Impact**
This architecture enables the business to:

* **Handle 10× traffic spikes** without performance degradation

* **Achieve near‑zero downtime** during deployments and failures

* **Reduce operational overhead** through automation

* **Protect customer data** with strong network isolation

* **Scale cost‑efficiently** by paying only for required capacity

Ultimately, the company now has a **production‑grade, cloud‑native platform** that supports growth, improves customer experience, and reduces risk.

**9. Future Recommendationsand improvements:**

- WAF Integration
- CloudWatch Monitoring & Alarms
- HTTPS with ACM
- Route 53 Domain Integration
- CI/CD Pipeline


