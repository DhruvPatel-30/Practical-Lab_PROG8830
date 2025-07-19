output "upper_case_name" {
  value = upper("terraform lab")
}

output "max_port_number" {
  value = max(80, 443, 8080)
}

output "number_of_subnets" {
  value = length([aws_subnet.public_subnet.id, aws_subnet.public_subnet_2.id])
}

output "current_time" {
  value = timestamp()
}

output "calculated_subnet" {
  value = cidrsubnet(aws_vpc.app.cidr_block, 4, 2)
}
