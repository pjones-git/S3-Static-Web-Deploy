variable "aws_region" {
  description = "AWS region to deploy into (e.g., us-east-1)"
  type        = string
}

# --- Option A (Recommended): Terraform Cloud OIDC assume role ---
# If you are running in Terraform Cloud with OIDC, you typically do NOT set access keys.
variable "assume_role_arn" {
  description = "IAM Role ARN to assume (recommended with Terraform Cloud OIDC)"
  type        = string
}



