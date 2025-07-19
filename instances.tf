resource "aws_instance" "nginx" {
  count         = 3
  ami           = nonsensitive(data.aws_ssm_parameter.amzn2_linux.value)
  instance_type = "t3.micro"

  subnet_id       = element([aws_subnet.public_subnet.id, aws_subnet.public_subnet_2.id], count.index % 2)
  security_groups = [aws_security_group.multi_port_sg["http"].id]

  user_data = <<EOF
#!/bin/bash
sudo amazon-linux-extras install -y nginx1
sudo systemctl start nginx
sudo rm /usr/share/nginx/html/index.html
echo "<html><head><title>Server ${count.index + 1}</title></head><body style='background-color:#1F778D'><p style='text-align: center;'><span style='color:#FFFFFF;font-size:28px;'>This is server ${count.index + 1}</span></p></body></html>" > /usr/share/nginx/html/index.html
EOF

  tags = {
    Name = "nginx-server-${count.index + 1}"
  }
}
