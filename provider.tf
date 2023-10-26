terraform {
  required_version = ">= 0.12.0"
  backend "s3" {
    bucket = "myterraform-tfstate"
    key    = "terraform.tfstate"
    region = "eu-central-1"
  }
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.9.0"
    }
  }
}

provider "aws" {
  region = var.region
}
