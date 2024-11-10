# Terraform EC2 Instance Creation

This repository contains a simple Terraform configuration for provisioning an EC2 instance in the AWS `ap-south-1` region. The configuration uses the `aws` provider and creates a `t2.micro` instance with a custom AMI ID.

## Prerequisites

Before running this configuration, ensure you have the following:

- **Terraform** installed (version 1.9.8 or higher).
- **AWS CLI** configured with your AWS credentials.
- **A valid AWS account** with permission to create EC2 instances.

## Getting Started

### 1. Clone this repository

```bash
git clone <repository-url>
cd <repository-directory>
```

### 2. Initialize Terraform

Run the following command to initialize the Terraform environment:

```bash
terraform init
```

This will download the necessary provider (in this case, AWS) and initialize the working directory.

### 3. Plan the Configuration

Run the following command to see what changes Terraform will make to your infrastructure:

```bash
terraform plan
```

This will show a preview of the resources Terraform will create or modify.

### 4. Apply the Configuration

To actually create the EC2 instance, use the `apply` command:

```bash
terraform apply
```

Terraform will prompt you for confirmation. Type `yes` to proceed.

### 5. Verify the EC2 Instance

After the apply is complete, you can go to the AWS Management Console to verify that the EC2 instance has been created in the `ap-south-1` region with the `t2.micro` instance type.

### 6. Destroy the Resources

Once you're done, you can destroy the created resources by running:

```bash
terraform destroy
```

Confirm with `yes` to remove the EC2 instance and any associated resources created by Terraform.

## Configuration Details

- **Provider**: AWS
  - Version: `~> 5.0`
  - Region: `ap-south-1`
- **Resource**: AWS EC2 Instance
  - Instance Type: `t2.micro`
  - AMI: `ami-0dee22c13ea7a9a67`
  - Tags: `Name = "Terraform_Demo"`

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
