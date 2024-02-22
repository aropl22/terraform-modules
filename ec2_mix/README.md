# Deploys three different types of EC2 instances

The code deployes EC2 instances on AWS:

-Ubuntu   
-Amazon Linux 2023        
-Windows Server 2022     

Module Declaration Example:

```terraform
module "ec2" {
  source                    = "./ec2"
  key_name                  = var.key_name                      #Ec2 key pair name
  key_path                  = var.key_path                      #private key 
  ubuntu_ec2                = var.ubuntu_ec2                    #this OS is not created when false
  ubuntu_ec2_count          = var.ubuntu_ec2_count              #number of instances to deploy
  ubuntu_ec2_instance_type  = var.ubuntu_ec2_instance_type      #instance type
  amzlnx_ec2                = var.amzlnx_ec2                    #this OS is not created when false
  amzlnx_ec2_count          = var.amzlnx_ec2_count              #number of instances to deploy
  amzlnx_ec2_instance_type  = var.amzlnx_ec2_instance_type      #instance type
  windows_ec2               = var.windows_ec2                   #this OS is not created when false
  windows_ec2_count         = var.windows_ec2_count             #number of instances to deploy
  windows_ec2_instance_type = var.windows_ec2_instance_type     #instance type
  vpc_security_group_ids    = ["${var.sg1}","${var.sg2}"]       #list of security groups
  subnet_id                 = data.aws_subnet.public.id         #deployment subnet ID
  windows_user_data_path    = var.windows_user_data_path        #path to userdata script
  amzlnx_user_data_path     = var.amzlnx_user_data_path         #path to userdata script
  ubuntu_user_data_path     = var.ubuntu_user_data_path         #path to userdata script
  default_tags              = var.default_tags                  #default tags
}
```