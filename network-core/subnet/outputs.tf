output "subnet_ids" {
  value = {
    for k, v in aws_subnet.subnet : k => v.id
  }
}

output "subnet_cidr" {
  value = {
    for k, v in aws_subnet.subnet : k => v.cidr_block
  }
}

