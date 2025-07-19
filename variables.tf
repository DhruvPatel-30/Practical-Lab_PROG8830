variable "sg_ports" {
  description = "Map of security group names and ports"
  type        = map(number)
  default = {
    http   = 80
    https  = 443
    custom = 8080
  }
}
