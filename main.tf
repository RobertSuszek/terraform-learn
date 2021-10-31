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
  region  = var.region
}

resource "aws_instance" "FortigateTest" {
  ami           = var.fortigate_AMI["7.0.2"]
  instance_type = var.size
  key_name      = var.key_name

  tags = {
    Name = "FGOnDemandImage"
  }
}

data "template_file" "FortiGate" {
  template = file("${var.bootstrap-fgtvm}")
}