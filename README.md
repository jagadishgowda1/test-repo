# AWS_EC2_with_Terraform

- The goal of this solution is to automate the deployment of a EC2 instance on AWS using Terraform.
- Terraform is an open-source IaC software tool that provides a consistent command line interface (CLI) workflow to manage hundreds of cloud services. 
- This involves provisioning a VPC to isolate the resources, assigning an Elastic IP address to ensure a static public for the instance, & configuring a key pair for secure SSH access.
- By leveraging the Infrastructure-as-code capabilites of terraform, We aim to streamline and simplify the process of setting up the EC2 instance and associated networking components, making it easier to replicate and manage the infrastructure.

## On this Page
- [Architecture Overview](#architecture-overview)
- [Prerequsites](#prerequsites)
- [Deployment Guide](#deployment-guide)
    - [Deploying with minimum permissions](#deploying-with-minimum-permissions)
    - [Customization](#customization)
    - [How to do the deployment](#how-to-do-the-deployment)
    - [Validating Deployment](#validating-deployment)

### Architecture Overview

![Blank diagram](https://github.com/RedingtonGroup/EC2-Reusable/assets/128025315/9db05589-3864-466c-b2ff-68df150ece7d)

### Prerequsites
- below are the software packages that as to be installed in order to run this solution
    - Terraform 
    - AWS CLI
    - Git
    - VS Code (or any code editor of your choice)

### Deployment Guide
- clone this repository onto your machine, navigate to the location where the clone was initiated, & follow the below sections to deploy the solution.

#### Deploying with minimum permissions
- The user must have access to the AWS CLI and the privileges to deploy EC2 instances and all of its components in order to deploy this solution.

#### Customization
- Reusable resource values have been applied in this solution in var file(var.tf). Modify the resource's default value to one that corresponds with the requirement.
- The variables used in the variable file (var.tf) are listed below, along with their values, make sure to modify the values as necessary. 
    - Region->us-east-1 
    - AZ->us-east-1a 
    - instance size->t2.micro 
    - OS-disk->15gb 
    - OS-disk-type->gp3
    - Datadisk->50gb 
    - Data-disk-type->gp3
    - keypair->tf-key, 
    - AMI->taken from us-east-1
- If an elastic IP is not required, make sure to remove the configuration file(elasticip.tf) that creates it and attaches to EC2.

##### note: As the AMI IDs vary from one region to the other, adjust the AMI ID according to the usage region. 

#### How to do the deployment
- terraform : Terraform init is a command that inititailzes a terraform project by setting up the necessary backend, plugins, and modules based on the configuration files in the project directory. refer image-i
```terraform
terraform init 
```

- Validating the code(configuration files) : Terraform validate is a command that checks the syntax and configuration of terraform files to ensure they are valid and free from errors 
```terraform
terraform validate
```

- Terraform apply : is a command that deploys the changes specified in the terraform configuration files to the target infrastructure, creating or modifying resources to achieve the desired state as defined in the configuration
```terraform
terraform apply 
```
- - note: terraform apply command runs the plan at first and then the prompts the user to approve yes/no in order to deploy/create the resources, user as to pass the approve at run time.


### Validating Deployment
- please use either of the below methods to validate the deployment.
    - Login to AWS console and vrify the resources deployed manually.
    - Run "terraform state list" this lists all the resources tracked in the Terraform state file. This command provides a summary of the resources created and managed by Terraform.

