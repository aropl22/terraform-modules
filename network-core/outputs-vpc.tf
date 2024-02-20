output "vpc_id" {
  value = module.vpc1.vpc_id
}

output "vpc_default_route_table_id" {
  value = module.vpc1.vpc_default_route_table_id
}

output "vpc_default_network_acl_id" {
  value = module.vpc1.vpc_default_network_acl_id
}

output "aws_internet_gateway_id" {
  value = module.network1.aws_internet_gateway_id
}

output "subnet_ids" {
  value = module.subnet1.subnet_ids
}

output "subnet_cidr" {
  value = module.subnet1.subnet_cidr
}

