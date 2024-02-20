variable "my_subnets" {
  description = "Subnets for VPC"
  type = map(object({
    cidr_block        = string
    availability_zone = string
    tags              = map(string)
  }))
}
variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "tags" {
  type = map(any)
}