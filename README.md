# Practical Lab 8 – PROG8830  
## AWS Infrastructure Automation with Terraform

This lab demonstrates the use of **advanced Terraform features** such as `for_each`, modules, expressions, functions, and reusable configurations to build a scalable infrastructure on AWS.

---

##  Project Overview

This Terraform configuration automates the deployment of a simple web application with the following architecture:

- A custom VPC with public subnets
- An internet gateway
- A security group allowing HTTP access
- Multiple EC2 instances running Nginx (using `for_each` in a module)
- (Optional) Load Balancer for distributing traffic


## How to run your configurations


### 1. Initialize Terraform

```bash
terraform init
```

### 2. Plan the deployment

```bash
terraform plan
```

### 3. Apply the configuration

```bash
terraform apply
```

---

## 📦 Clean up

To destroy all created resources:

```bash
terraform destroy
```

---

##    The purpose and functionality of each task

- ✅ Use of `for_each` to create security group rules dynamically  
- ✅ Use of `count` to deploy multiple EC2 instances  
- ✅ Use of modules for EC2 provisioning  
- ✅ Use of data sources (`aws_ssm_parameter`, `aws_availability_zones`)  
- ✅ Advanced expressions and built-in functions  
- ✅ Tagging and custom user-data for Nginx setup  



## The lessons learned regarding the practical differences between using count and
for_each, and how functions enhance your IaC practices.
count comes in handy when you desire to produce numerous same resources. It is index-based (e.g. count.index) and will work for a fermentable list or simple repeating values.

for_each is preferable in the cases of maps or sets where each resource contains specific properties. It provides more control and flexibility, in particular, whenever resource names or attributes vary.

Terraform built-in functions (such as cidrsubnet, timestamp, max, upper, element etc.) enable me to:

Computations and configuring of values on a dynamic basis
With such functions I made my configuration more scalable and smart, e.g. determine subnet ranges, create instance names or port mappings dynamically.