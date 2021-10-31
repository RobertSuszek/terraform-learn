resource "aws_internet_gateway" "default" {
  vpc_id = aws_vpc.fortigate_lab.id
  tags = {
    Name = "Default"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.fortigate_lab.id

  tags = {
    Name = "Public"
  }
}

resource "aws_route" "external" {
  route_table_id         = aws_route_table.public
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.default.id
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public.id
}

resource "aws_security_group" "allow_mgmt_public" {
  name        = "Allow management public"
  description = "Allow management over public IP address"
  vpc_id      = aws_vpc.fortigate_lab.id

  ingress = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "6"
      cidr_blocks = ["${chomp(data.http.myip.body)}/32"]
    },
    {
      from_port   = 443
      to_port     = 443
      protocol    = "6"
      cidr_blocks = ["${chomp(data.http.myip.body)}/32"]
    }
  ]

  egress = [
    {
      cidr_blocks = ["0.0.0.0/0"]
      from_port   = 0
      to_port     = 0
    }
  ]
}