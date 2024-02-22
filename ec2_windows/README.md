# Deploys three different types of EC2 instances

The code deployes Windows Server 2022 EC2 instances on AWS and configures SSH server service for use with Ansible   

Module Declaration Example:

```terraform
module "ec2_windows" {
  source                    = "./ec2_windows"
  key_name                  = var.key_name                      #Ec2 key pair name
  key_path                  = var.key_path                      #private key 
  windows_ec2_count         = var.windows_ec2_count             #number of instances to deploy
  windows_ec2_instance_type = var.windows_ec2_instance_type     #instance type
  vpc_security_group_ids    = ["${var.sg1}","${var.sg2}"]       #list of security groups
  subnet_id                 = data.aws_subnet.public.id         #deployment subnet ID
  windows_user_data_path    = var.windows_user_data_path        #path to userdata script
  default_tags              = var.default_tags                  #default tags
}
```