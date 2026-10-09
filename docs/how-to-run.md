# Terraform AWS Setup and Deployment Guide

## 1. Prerequisites
Install or prepare the following before running the project:
1. **AWS Account:** Required to create and manage cloud resources.
2. **Terraform CLI:** Used to execute the Terraform `.tf` configuration files.
3. **AWS CLI:** Used to configure and verify AWS credentials.
4. **VS Code:** Used to write and manage the project files.
5. **Git and GitHub:** Used to version-control and publish the project.

## 2. Configure AWS Credentials
### Verify AWS Credentials
If AWS CLI is already configured on your computer, verify your AWS identity using: aws sts get-caller-identity
This command displays information about the AWS account and identity being used.

### Configure AWS Credentials
If AWS CLI is not configured, use an appropriate IAM identity with the required permissions: aws configure
Follow the prompts to configure your AWS access key, secret key, default region, and output format.

**Security precautions:**
* Use an IAM identity with the least privileges required for the project.
* Never put AWS access keys or secret keys in Terraform files or your GitHub repository.
* Do not commit credentials or sensitive Terraform state files to GitHub.
* Terraform's AWS provider can use credentials configured through the AWS CLI.

## 3. Project File Structure
The project repository contains the following files:
```text
terraform-aws-webserver/
├── main.tf
├── variables.tf
├── outputs.tf
├── .gitignore
├── README.md
└── docs/
    └── terraform-aws-setup-and-deployment.md
```

### What Each File Does
* **main.tf:** Defines the AWS provider and the infrastructure resources, including the VPC, subnet, Internet Gateway, route table, security group, and EC2 instance.
* **variables.tf:** Defines configurable input values, such as the AWS region and EC2 instance type.
* **outputs.tf:** Displays useful information after deployment, such as the VPC ID, EC2 instance ID, public IP, and website URL.
* **.gitignore:** Prevents local Terraform state, working directories, and potentially sensitive local files from being committed.
* **README.md:** Documents the project, architecture, prerequisites, and execution steps.
* **docs/terraform-aws-setup-and-deployment.md:** Explains the prerequisites, configuration, execution workflow, and cleanup process.
We keep the first version straightforward by defining the main infrastructure resources in `main.tf`.

## 4. Write the Terraform Configuration
### 4.1. main.tf
The main.tf file defines the AWS provider, networking resources, security group, EC2 instance, and web server installation.
The configuration uses the official AWS provider and Terraform resources such as `aws_instance`, `aws_vpc`, `aws_subnet`, `aws_route_table`, and `aws_security_group`.

### 4.2. variables.tf
The variables.tf file allows us to change the AWS region or EC2 instance type without editing the main infrastructure configuration.
For example:
* ap-south-1 is the AWS Mumbai region.
* t3.micro is the example EC2 instance type.
The availability, account eligibility, and cost of an instance type depend on the AWS account and region.

### 4.3. outputs.tf
The outputs.tf file displays useful information after Terraform creates the infrastructure.
For this project, the outputs include:
* VPC ID
* EC2 instance ID
* EC2 public IP address
* Website URL
We can use these outputs to verify the deployment and access the web server.

### 4.4. .gitignore
The .gitignore file keeps local Terraform state, downloaded provider files, and other generated or potentially sensitive files out of Git.
Do not commit Terraform state files or credentials.
The `.terraform.lock.hcl` file records the selected provider versions and checksums. It is generally useful to commit this lock file so that provider installations remain consistent across environments.

## 5. Execute the Terraform Project
Open a terminal in the `terraform-aws-webserver` project directory and run the following commands in order.
### Step 1: Check the Installed Tools
```bash
terraform -version
aws --version
```
Both commands should display their installed versions.
### Step 2: Verify AWS Authentication : aws sts get-caller-identity
Confirm that the AWS account and identity are the ones you intend to use.

### Step 3: Initialize Terraform : terraform init
Terraform downloads the required AWS provider and prepares the working directory.

### Step 4: Format and Validate the Configuration
```bash
terraform fmt
terraform validate
```
* terraform fmt formats the Terraform configuration files.
* terraform validate checks the configuration for syntax and internal consistency errors.

### Step 5: Preview the Infrastructure Changes terraform plan
Review the resources Terraform intends to create. At this stage, Terraform previews the changes without applying them.

### Step 6: Create the AWS Infrastructure : terraform apply
Review the proposed changes and type `yes` when Terraform requests confirmation.
Terraform will create the resources if the configuration, AWS credentials, IAM permissions, quotas, and regional resource availability are valid.

### Step 7: Display the Outputs : terraform output
Find the website_url output and open it in your browser.
The page should display:

**Hello from Terraform on AWS!**
The EC2 instance needs time to start and install the web server. If the page does not load immediately, wait a little and check the instance status and system logs.

## 6. Understand the Terraform Workflow
The general workflow for this project is:
Write `.tf` Files → `terraform init` → `terraform fmt` → `terraform validate` → `terraform plan` → `terraform apply` → AWS Resources Created

### Explanation of the Workflow
1. **Write `.tf` files:** Define the desired infrastructure using Terraform configuration.
2. **Initialize:** Download the required providers and prepare the working directory.
3. **Format:** Format the configuration files.
4. **Validate:** Check the configuration for errors.
5. **Plan:** Preview the proposed infrastructure changes.
6. **Apply:** Create or update the AWS resources after confirmation.
7. **Verify:** Check Terraform outputs and test the deployed application.

## 7. Important Security and Cost Precautions
* **Security group:** The current configuration allows inbound HTTP traffic on port 80 only. SSH access is not enabled.
* **HTTP:** HTTP traffic is unencrypted. Use HTTPS for production applications.
* **AWS costs:** EC2 instances, public IPv4 addresses, and related resources may incur charges. Review current AWS pricing before deployment.
* **Credentials:** Never commit AWS credentials or other secrets to GitHub.
* **Verification:** Check the AWS Console to confirm that the resources have been created successfully.

## 8. Destroy the Infrastructure After Testing
When you have finished testing and no longer need the resources, run: terraform destroy
Review the proposed deletions and type `yes` to confirm.
This removes the resources tracked by the current Terraform configuration. Do not run this command against infrastructure you need to keep.
fter destruction, verify in the AWS Console that the project resources have been removed and that no billable resources remain.

## 9. Important Note
Creating Terraform files in GitHub stores the configuration in the repository; it does not execute Terraform or create AWS resources by itself.
To provision the infrastructure, Terraform must run in an environment with Terraform installed, valid AWS credentials, and the necessary IAM permissions. Examples include a local machine, a configured CI/CD runner, or GitHub Actions.
This project demonstrates the fundamentals of Infrastructure as Code and AWS infrastructure provisioning using Terraform.
