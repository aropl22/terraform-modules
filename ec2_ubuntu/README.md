# Deploys three different types of EC2 instances

The code deployes Ubuntu 22.04 EC2 instances on AWS:

Module Declaration Example:

```terraform
module "ec2_ubuntu" {
  source                    = "./ec2_ubuntu"
  key_name                  = var.key_name                      #Ec2 key pair name
  ubuntu_ec2                = var.ubuntu_ec2                    #this OS is not created when false
  ubuntu_ec2_count          = var.ubuntu_ec2_count              #number of instances to deploy
  ubuntu_ec2_instance_type  = var.ubuntu_ec2_instance_type      #instance type
  vpc_security_group_ids    = ["${var.sg1}","${var.sg2}"]       #list of security groups
  subnet_id                 = data.aws_subnet.public.id         #deployment subnet ID
  ubuntu_user_data_path     = var.ubuntu_user_data_path         #path to userdata script
  default_tags              = var.default_tags                  #default tags
}
```