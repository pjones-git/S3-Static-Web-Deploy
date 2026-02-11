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

  cloud {
    organization = "LXTCH"

    workspaces {
      name = "S3-Static-Web-Deploy"
    }
  }
}
