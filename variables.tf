variable "key_name" {
  description = "Name of SSH key to connect"
  type        = string
  default     = "master"
}

variable "region" {
  description = "AWS region to create environment in"
  type        = string
  default     = "eu-central-1"
}

variable "size" {
  description = "Instance size"
  type        = string
  default     = "t2.small"
}

variable "fortigate_AMI" {
  description = "AMI for FortiGates by version"
  type        = map(any)
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
  description = "Path for Fortigate inital configuration file"
  type        = string
  default     = "initial_config.conf"
}