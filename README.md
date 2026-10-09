# terraform-aws-webserver-
Provision AWS infrastructure using Terraform (VPC, subnet, security group, and EC2 web server).
# Terraform AWS Web Server

## Project Overview
This project demonstrates how to provision AWS infrastructure using Terraform, an Infrastructure as Code (IaC) tool.
Instead of creating resources manually in the AWS Management Console, we define the infrastructure in Terraform configuration files.

## AWS Resources
* Amazon VPC
* Public subnet
* Internet Gateway
* Route table and subnet association
* Security group
* Amazon EC2 instance
* Amazon Linux 2023 web server

## Project Structure
```text
terraform-aws-webserver/
├── main.tf
├── variables.tf
├── outputs.tf
├── .gitignore
└── README.md
```

## Tools Used
* Terraform
* Amazon Web Services (AWS)
* AWS CLI
* Git and GitHub

## How It Works
Terraform configuration → AWS Provider → AWS Infrastructure → EC2 Web Server

## Terraform Workflow
1. terraform init — initializes Terraform and downloads the required provider.
2. terraform fmt — formats the configuration files.
3. terraform validate — validates the configuration.
4. terraform plan — previews the infrastructure changes.
5. terraform apply — creates the infrastructure after confirmation.
6. terraform output — displays the output values.
7. terraform destroy — removes the infrastructure managed by this configuration.

## Security Notes

* The security group allows inbound HTTP traffic on port 80.
* SSH access is not enabled in this example.
* Never commit AWS credentials or Terraform state files to GitHub.
* Review AWS pricing before creating resources.
* Destroy the resources after testing if they are no longer needed.

## Important Note
Creating files in GitHub stores the Terraform configuration in the repository. It does not execute Terraform or create AWS resources by itself.
To deploy this infrastructure, Terraform must be executed in an environment that has Terraform installed and valid AWS credentials, such as a local machine or a properly configured CI/CD runner.
