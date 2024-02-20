output "vpc_id" {
  value = aws_vpc.vpc1.id
}

output "vpc_default_route_table_id" {
  value = aws_vpc.vpc1.default_route_table_id
}

output "vpc_default_network_acl_id" {
  value = aws_vpc.vpc1.default_network_acl_id
}