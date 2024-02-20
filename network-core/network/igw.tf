resource "aws_internet_gateway" "igw" {

  vpc_id = var.vpc_id

  tags = {
    Name = join("-", ["VPC1", "igw1", var.subnet_cidr])
  }
}