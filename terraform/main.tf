terraform {
  backend "s3" {
    bucket = "tarik-tf"
    key    = "personal.tfstate"
    region = "eu-west-1"
  } 
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
}

provider "aws" { 
  region = "eu-west-1"
}
