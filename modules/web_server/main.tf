resource "aws_instance" "nginx" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  security_groups = var.security_group_ids

  user_data = <<EOF
#!/bin/bash
sudo amazon-linux-extras install -y nginx1
sudo systemctl start nginx
sudo rm /usr/share/nginx/html/index.html
echo "<html><head><title>Server ${var.server_number}</title></head><body style='background-color:#1F778D'><p style='text-align: center;'><span style='color:#FFFFFF;font-size:28px;'>This is server ${var.server_number}</span></p></body></html>" > /usr/share/nginx/html/index.html
EOF

  tags = {
    Name = "nginx-server-${var.server_number}"
  }
}

output "instance_id" {
  value = aws_instance.nginx.id
}
