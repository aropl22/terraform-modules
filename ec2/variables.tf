variable "key_name" {
  description = "EC2 Key Pair"
  type        = string
}

variable "key_path" {
  description = "EC2 Key Pair"
  type        = string
}

variable "ubuntu_ec2" {
  description = "creating windows ec2 instance"
  type        = list(bool,number,string) # (true/false,number_of_instances,instance_type)
  default     = false
}

variable "amzlnx_ec2" {
  description = "creating windows ec2 instance"
  type        = list(bool,number,string) # (true/false,number_of_instances,instance_type)
  default     = false
}

variable "windows_ec2" {
  description = "creating windows ec2 instance"
  type        = list(bool,number,string) # (true/false,number_of_instances,instance_type)
  default     = false
}

variable key_name {
  description = "key pair name"
  type        = string
}

variable vpc_security_group_ids {
  description = "security groups"
  type        = list()
}

variable subnet_id {
  description = "subnet to deploy ec2 in"
  type        = string
}

variable user_data {
  description = "add user data to ec2"
  type        = string
}

variable "default_tags" {
  type = map(any)
}