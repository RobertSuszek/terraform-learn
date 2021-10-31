terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "rsuszek-learn"
  region  = "eu-central-1"
}

resource "aws_instance" "fg_ondemand" {
  ami           = "ami-07e1b42208e73e245"
  instance_type = "t2.small"
  key_name      = "master"

  tags = {
    Name = "FGOnDemandImage"
  }
}