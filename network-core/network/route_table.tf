resource "aws_route" "route" {

  route_table_id         = var.default_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id

}

resource "aws_route_table" "private_route_table" {

  vpc_id = var.vpc_id

  tags = {
    Name = "Private Route Table"
  }

}

resource "aws_route_table_association" "private_route" {

  route_table_id = aws_route_table.private_route_table.id
  subnet_id      = var.private_subnet_id
}

