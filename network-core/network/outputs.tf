output "aws_internet_gateway_id" {
  value = aws_internet_gateway.igw.id
}

output "aws_private_route_table_id" {
  value = aws_route_table.private_route_table.id
}