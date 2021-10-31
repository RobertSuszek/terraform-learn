resource "aws_network_interface" "eth0" {
  description = "Fortigate-port1"
  subnet_id   = aws_subnet.public_subnet.id
}

resource "aws_network_interface_sg_attachment" "public" {
  depends_on = [
    aws_network_interface.eth0
  ]
  security_group_id    = aws_security_group.allow_mgmt_public.id
  network_interface_id = aws_network_interface.eth0.id
}

resource "aws_instance" "fortigate" {
  ami           = var.fortigate_ami["7.0.2"]
  instance_type = var.size
  key_name      = var.key_name
  user_data     = data.template_file.fortigate_initial_config.rendered

  root_block_device {
    volume_type = "standard"
    volume_size = "2"
  }

  ebs_block_device {
    device_name = "/dev/sdb"
    volume_size = "30"
    volume_type = "standard"
  }

  network_interface {
    network_interface_id = aws_network_interface.eth0.id
    device_index         = 0
  }
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