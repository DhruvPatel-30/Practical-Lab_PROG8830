provider "aws" {
  region = "us-east-1"
}

module "nginx_instances" {
  source = "./modules/web_server"

  for_each = {
    1 = aws_subnet.public_subnet.id
    2 = aws_subnet.public_subnet_2.id
    3 = aws_subnet.public_subnet.id
  }

  ami                = data.aws_ssm_parameter.amzn2_linux.value
  instance_type      = "t3.micro"
  subnet_id          = each.value
  security_group_ids = [aws_security_group.multi_port_sg["http"].id]
  server_number      = each.key
}
