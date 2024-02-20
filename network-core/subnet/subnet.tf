resource "aws_subnet" "subnet" {

  for_each = var.my_subnets

  vpc_id            = var.vpc_id
  cidr_block        = each.value.cidr_block
  availability_zone = each.value.availability_zone
  tags              = merge(each.value.tags, var.tags)
}