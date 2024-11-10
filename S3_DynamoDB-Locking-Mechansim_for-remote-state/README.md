
# Terraform S3 Backend Setup with DynamoDB Locking

This Terraform configuration automates the creation of an S3 bucket and a DynamoDB table, which are used for managing Terraform's remote state. These resources enable you to store your state files securely in S3, and the DynamoDB table ensures state locking to prevent concurrent state modifications.

## Requirements

- **Terraform**: Version 1.9.5 or higher
- **AWS CLI**: Configured with valid credentials and a region set (e.g., `ap-south-1`).

## Resources Created

1. **S3 Bucket** (`terraform_state`): 
   - Stores the Terraform state files.
   - Versioned to keep a history of state changes.
   - Server-side encryption enabled for secure storage.

2. **DynamoDB Table** (`terraform-lock`):
   - Used for state locking to avoid race conditions during concurrent operations on the Terraform state.
   - `LockID` is the hash key to uniquely identify the lock.

## Steps to Use

1. **Clone the repository**:

   ```bash
   git clone https://github.com/ayushsharma-1/Terraform-Configuration.git
   cd Terraform-Configuration/S3_DynamoDB-Locking-Mechansim_for-remote-state
   ```

2. **Initialize Terraform**:

   This will install the necessary providers and initialize the working directory.

   ```bash
   terraform init
   ```

3. **Apply the configuration**:

   Run the following command to create the resources. Ensure you have valid AWS credentials configured.

   ```bash
   terraform apply
   ```

   You will be prompted to confirm the changes. Type `yes` to proceed.

4. **Outputs**:

   After the apply process is complete, you will see the following outputs:

   - `s3_bucket_name`: The name of the created S3 bucket.
   - `s3_bucket_arn`: The ARN of the S3 bucket.
   - `s3_bucket_region`: The AWS region where the bucket is created.
   - `dynamodb_table_name`: The name of the DynamoDB table used for state locking.
   - `dynamodb_table_arn`: The ARN of the DynamoDB table.

## Example Output

```bash
Apply complete! Resources: 2 added, 0 changed, 0 destroyed.

Outputs:

s3_bucket_name = <account_id>-terraform-states
s3_bucket_arn = arn:aws:s3:::<account_id>-terraform-states
s3_bucket_region = us-west-2
dynamodb_table_name = terraform-lock
dynamodb_table_arn = arn:aws:dynamodb:us-west-2:123456789012:table/terraform-lock
```

## Usage Notes

- **State Locking**: The DynamoDB table ensures that Terraform operations on the state file are locked to avoid concurrent changes.
- **Versioning**: The S3 bucket is configured with versioning enabled, which allows you to maintain a history of your Terraform state files.
- **Encryption**: The state files stored in the S3 bucket are encrypted with AES-256 encryption by default.

## Cleanup

To destroy the resources you created, run the following command:

```bash
terraform destroy
```

Confirm the action by typing `yes`.
