variable "vpc_name" {
  description = "VPC Name"
  type        = string
}

variable "vpc_cidr_block" {
  description = "VPC block"
  type        = string
}

variable "tags" {
  type = map(any)
}