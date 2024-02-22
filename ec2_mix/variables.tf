variable "key_name" {
  description = "EC2 Key Pair"
  type        = string
}

variable "key_path" {
  description = "EC2 Key Pair"
  type        = string
}

variable "ubuntu_ec2" {
  description = "creating ubuntu ec2 instance"
  type        = bool
  default     = false
}

variable "ubuntu_ec2_count" {
  description = "number of instances"
  type        = number
  default     = 0
}

variable "ubuntu_ec2_instance_type" {
  description = "instance type"
  type        = string
  default     = "t2.micro"
}

variable "amzlnx_ec2" {
  description = "creating amazon linux 3 ec2 instance"
  type        = bool
  default     = false
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

variable "windows_ec2" {
  description = "creating windows ec2 instance"
  type        = bool
  default     = false
}

variable "windows_ec2_count" {
  description = "number of instances"
  type        = number
  default     = 0
}

variable "windows_ec2_instance_type" {
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

variable "ubuntu_user_data_path" {
  description = "add user data to ec2"
  type        = string
}

variable "amzlnx_user_data_path" {
  description = "add user data to ec2"
  type        = string
}

variable "windows_user_data_path" {
  description = "add user data to ec2"
  type        = string
}

variable "default_tags" {
  type = map(any)
}