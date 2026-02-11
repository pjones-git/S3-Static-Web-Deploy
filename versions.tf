terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.5"
    }
  }

  # OPTIONAL (Recommended): If you are using Terraform Cloud workspace "S3-Static-Web-Deploy"
  # Uncomment and set your org name.
  #
  # cloud {
  #   organization = "LXTCH"
  #   workspaces {
  #     name = "S3-Static-Web-Deploy"
  #   }
  # }
}
