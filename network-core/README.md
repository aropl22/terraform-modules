# Deploys AWS network core using Terraform

The code deployes a network core on AWS:

-VPC  
-Subnet/Subnets     
-Internet Gateway  
-Route Table 

Module Declaration Example:

```terraform
module "network-core" {
  source = "./network-core"
  vpc_name       = var.vpc_name
  vpc_cidr_block = var.vpc_cidr_block
  my_subnets     = var.my_subnets
  tags           = var.default_tags

}
```

Deployment Example:

![GitHub Image](/network-core/img/network-core.png)

## Terraform variable definitions

To set lots of variables, it's more convenient to specify their values in a variable definitions file (.tfvars or .tfvars.json)
and then specify that file on the command line with -var-file

 Example (terraform.tfvars):

```terraform

#Variable declaration: 

region = "us-west-1" #AWS region
vpc_name = "VPC 1" # AWS VPC name
vpc_cidr_block = "10.100.200.0/23" # AWS VPC subnet CIDR


# Subnet declaration

my_subnets = {
  "public_subnet" = {
    cidr_block        = "10.100.200.0/24"
    availability_zone = "us-west-1b"
    tags = {
      Name = "Public Subnet"
  } },
  "private_subnet" = {
    cidr_block        = "10.100.201.0/24"
    availability_zone = "us-west-1b"
    tags = {
      Name = "Private Subnet"
  } }
}

# Tags declaration

variable "default_tags" {
  type = map(any)
  default = {
    managed_by : "Terraform",
    stack : "test",
    project : "1"
  }
}

```

## Outputs:

- aws_internet_gateway_id
- private_subnet_id
- public_subnet_id
- vpc_default_network_acl_id
- vpc_default_route_table
- vpc_id
