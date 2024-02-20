variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "subnet_cidr" {
  description = "Subnet CIDR"
  type        = string
}

variable "default_route_table_id" {
  description = "Rout table ID"
  type        = string
}


variable "private_subnet_id" {
  description = "VPC ID"
  type        = string
}

variable "tags" {
  type = map(any)
}