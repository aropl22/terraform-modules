# Deploys AWS network core using Terraform

The code deployes a network core on AWS:

-VPC  
-Subnet/Subnets     
-Internet Gateway  
-Route Table   

Deployment Example:

![GitHub Image](/img/network-core.png)



Must define backend and AWS access keys
Terraform defaults to using the local backend, which stores state as a plain file in the current working directory.

More info:  
https://developer.hashicorp.com/terraform/language/settings/backends/configuration

 Examples:

### Terraform Cloud backend file

```terraform
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.31.0"
    }
  }

  cloud {
    organization = "YOUR ORGANIZATION NAME"

    workspaces {
      name = "YOUR WORKSPACE NAME"
    }
  }
}
```

### Local Backend

```terraform
terraform {
  backend "local" {
    path = "relative/path/to/terraform.tfstate"
  }
}
```

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
