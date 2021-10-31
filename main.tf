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

resource "aws_instance" "fortigate_test" {
  ami           = var.fortigate_AMI["7.0.2"]
  instance_type = var.size
  key_name      = var.key_name
  user_data     = data.template_file.fortigate_initial_config.rendered

  tags = {
    Name = "Fortigate Test"
  }
}

data "template_file" "fortigate_initial_config" {
  template = file("${var.fortigate_initial_config_path}")
}