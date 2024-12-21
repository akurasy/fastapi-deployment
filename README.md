## Build and Deploy FastAPI Application to AWS ECS using Terraform and using Github Actions as CI/CD pipeline

This is a simple FastAPI application that returns the current server time using the load balancer dns url.

This repository contains a GitHub Actions workflow to build a Docker image for a FastAPI application and deploy it to an Amazon ECS cluster. The process uses Terraform for infrastructure setup and manages the entire deployment pipeline with automation. Terraform modules is used to provision the infrastructure for ease, simplicity and to have a reusable code base.

Application: This application is containerized as a Docker image on Amazon ECR private repository  and deployed on AWS ECS. 

## Deployment Structure
The deployment consist of the following components
# Components

| Component                  |  |
|----------------------------|----------|
| 1. VPC                     |    ✅   |
| 2. Private and Public Subnets |  ✅   |
| 3. Route Tables            |    ✅   |
| 4. NAT Gateways            |    ✅   |
| 5. Load Balancers          |    ✅   |
| 6. ECR                     |    ✅   |
| 7. ECS                     |    ✅   |

| Component                  | Required |
|----------------------------|----------|
| 1 ECR IMAGE                     |    ✅   |
| 2 Task Definition |  ✅   |
| 3 Services            |    ✅   |

## Getting Started 

### Prerequisites

Before you begin, ensure you have the following prerequisites in place:

1. **AWS acess key and secret Key Configured**: To interact with AWS services, you'll need to configure your AWS access key and secret key to authenticate with AWS. You can set up access keys from the AWS IAM console.

2.  **A github Account**: To push this repository to github to run the necessary workflow with github runners.

Fork this repository and create the following secrets for your secret key, access key and AWS region 

follow these steps to create a secret:
1. Goto the application repository
2. Goto settings
3. on the lower left, click on secret and variables
4. create new repository secret
   

# STEP1 (Infrastructure Provisioning) (deploy-terraform)
The workflow is divided into two jobs: deploy-terraform and build and run image. the step one will cover the contents of deploy-terraform job.

in the infrascture provision, aws modules were used to have a simple, dynamic and reusable terraform script. For details on AWS ECS modules, [please visit the official terraform documentation](https://registry.terraform.io/modules/terraform-aws-modules/ecs/aws/latest)

The deploy-terraform job initializes, validates, plans, formats, and applies Terraform configurations to set up AWS infrastructure. 

Terraform key commands in the pipeline: 
```
# Initialize Terraform
terraform init

# Validate Terraform configurations
terraform validate

# Plan infrastructure changes
terraform plan

# Format Terraform files
terraform fmt

# Apply changes with auto-approval
terraform apply --auto-approve
```

The terraform apply command creates a VPC, a Route Table, a NAT Gateway, Load Balancer, Security Group, ECR Repository, ECS Cluster and other object of the ECS cluster like task definition. These resources a created when this pipeline is trigerred. 




