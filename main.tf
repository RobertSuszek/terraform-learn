resource "aws_instance" "fortigate" {
  ami           = var.fortigate_ami["7.0.2"]
  instance_type = var.size
  key_name      = var.key_name
  user_data     = data.template_file.fortigate_initial_config.rendered

  tags = {
    Name = "Fortigate"
  }
}

data "template_file" "fortigate_initial_config" {
  template = file("${var.fortigate_initial_config_path}")
}

data "http" "myip" {
  url = "http://ipv4.icanhazip.com"
}