resource "aws_lb" "nginx_lb" {
  name               = "lab-8"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.load_balancer_sg.id]
  subnets            = [aws_subnet.public_subnet.id, aws_subnet.public_subnet_2.id]

  tags = { Name = "LB for lab 8" }
}

resource "aws_lb_target_group" "nginx_tg" {
  name     = "ntg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.app.id
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.nginx_lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.nginx_tg.arn
  }
}

resource "aws_lb_target_group_attachment" "nginx_attachment" {
  for_each         = module.nginx_instances
  target_group_arn = aws_lb_target_group.nginx_tg.arn
  target_id        = each.value.instance_id
  port             = 80
}
