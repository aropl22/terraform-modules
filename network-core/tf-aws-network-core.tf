
module "vpc1" {
  source         = "./vpc"
  vpc_cidr_block = var.vpc_cidr_block
  vpc_name       = var.vpc_name
  tags = merge(var.tags,
    {
      "Name" = "${var.vpc_name}"
    }
  )
}

module "subnet1" {
  source = "./subnet"
  vpc_id     = module.vpc1.vpc_id
  my_subnets = var.my_subnets
  tags = var.tags
}

module "network1" {
  source = "./network"
  vpc_id                 = module.vpc1.vpc_id
  subnet_cidr            = module.subnet1.subnet_cidr["public_subnet"]
  default_route_table_id = module.vpc1.vpc_default_route_table_id
  private_subnet_id      = module.subnet1.subnet_ids["private_subnet"]
  tags = var.tags

}
