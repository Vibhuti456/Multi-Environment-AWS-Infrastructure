# Multi-Environment AWS Infrastructure using Terraform Modules

This project implements a modular and multi-environment AWS infrastructure using Terraform. It provisions essential cloud resources like VPCs, EC2 instances, and S3 buckets, and is structured to separate environments (like dev, staging, and prod) using environment-specific configurations.

This approach enables safe, scalable, and isolated deployments, making it suitable for teams practicing modern DevOps.

```
terraform-modules/
├── main.tf                 
└── infra-app/
    ├── terraform.tf         
    ├── bucket.tf           
    ├── table.tf           
    ├── server.tf           
    ├── provider.tf 
    └── variables.tf
```
####  Purpose of Each File in infra-app Module

1. 𝐛𝐮𝐜𝐤𝐞𝐭.𝐭𝐟 - 	Defines AWS S3 bucket resource for static site or storage.
2. 𝐭𝐚𝐛𝐥𝐞.𝐭𝐟 - Defines AWS DynamoDB table (e.g., for remote backend locking or app use).
3. 𝐬𝐞𝐫𝐯𝐞𝐫.𝐭𝐟 - Defines EC2 instance, AMI, security group, etc.
4. 𝐯𝐚𝐫𝐢𝐚𝐛𝐥𝐞𝐬.𝐭𝐟	- Input variables for customization like region, instance type, bucket name.
5. 𝐭𝐞𝐫𝐫𝐚𝐟𝐨𝐫𝐦.𝐭𝐟 — to install the required providers and their versions.
6. 𝐩𝐫𝐨𝐯𝐢𝐝𝐞𝐫𝐬.𝐭𝐟 - Defines the  region want to work in cloud. (optional)
7. 𝐦𝐚𝐢𝐧.𝐭𝐟 - Defines all the configurations related to the infrastructure.
