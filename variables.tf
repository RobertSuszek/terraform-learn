variable "key_name" {
  default = "master"
}

variable "region" {
  default = "eu-central-1"
}

variable "size" {
  default = "t2.small"
}

variable "fortigate_ami" {
  type = map(any)
  default = {
    "7.0.2" = "ami-07e1b42208e73e245"
    "7.0.1" = "ami-0c48bc0e23f9042fc"
    "6.4.7" = "ami-0026cf2f0ab64b87b"
    "6.4.6" = "ami-0781f07684853501c"
    "6.2.5" = "ami-074ed751bba670031"
    "6.2.3" = "ami-0c380ca68f2b1f6e8"
  }
}

variable "fortigate_initial_config_path" {
  default = "initial_config.conf"
}

variable "vpc_cidr" {
  default = "10.10.0.0/16"
}

variable "public_subnet" {
  default = "10.10.0.0/24"
}

variable "private_subnet" {
  default = "10.10.1.0/24"
}