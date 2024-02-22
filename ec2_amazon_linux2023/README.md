# Deploys three different types of EC2 instances

The code deployes Amazon Linux 2023 EC2 instances on AWS:

Module Declaration Example:

```terraform
module "ec2_amazon_linux2023" {
  source                    = "./ec2_amazon_linux2023"
  key_name                  = var.key_name                      #Ec2 key pair name
  amzlnx_ec2_count          = var.amzlnx_ec2_count              #number of instances to deploy
  amzlnx_ec2_instance_type  = var.amzlnx_ec2_instance_type      #instance type
  vpc_security_group_ids    = ["${var.sg1}","${var.sg2}"]       #list of security groups
  subnet_id                 = data.aws_subnet.public.id         #deployment subnet ID
  amzlnx_user_data_path     = var.amzlnx_user_data_path         #path to userdata script
  default_tags              = var.default_tags                  #default tags
}
```