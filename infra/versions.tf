terraform {
  required_version = ">= 1.10" # use_lockfile (verrou natif S3) demande 1.10 au minimum

  # État stocké dans S3 (bucket défini dans state.tf). Verrou par fichier : pas de DynamoDB.
  backend "s3" {
    bucket       = "ai-engine-tfstate-0852ca23"
    key          = "ai-engine/terraform.tfstate"
    region       = "eu-north-1"
    encrypt      = true
    use_lockfile = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = var.region

  default_tags {
    tags = {
      project = "ai-engine"
    }
  }
}
