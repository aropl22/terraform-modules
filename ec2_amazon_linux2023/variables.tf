variable "key_name" {
  description = "EC2 Key Pair"
  type        = string
}

variable "amzlnx_ec2_count" {
  description = "number of instances"
  type        = number
  default     = 0
}

variable "amzlnx_ec2_instance_type" {
  description = "instance type"
  type        = string
  default     = "t2.micro"
}

variable "vpc_security_group_ids" {
  description = "security groups"
  type        = list(any)
}

variable "subnet_id" {
  description = "subnet to deploy ec2 in"
  type        = string
}

variable "amzlnx_user_data_path" {
  description = "add user data to ec2"
  type        = string
}

variable "default_tags" {
  type = map(any)
}

variable "key_path" {
  description = "EC2 Key Pair"
  type        = string
}