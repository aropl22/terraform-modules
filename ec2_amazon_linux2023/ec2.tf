data "aws_ami" "amazonlinux3" {
  most_recent = true
  owners      = ["137112412989"] # Amazon
  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  #owners = ["309956199498"] # RedHat
}

resource "aws_instance" "amzlnx" {
  count                       = var.amzlnx_ec2_count
  ami                         = data.aws_ami.amazonlinux3.id
  instance_type               = var.amzlnx_ec2_instance_type
  key_name                    = var.key_name
  associate_public_ip_address = true
  vpc_security_group_ids      = var.vpc_security_group_ids
  subnet_id                   = var.subnet_id
  user_data                   = file("${var.amzlnx_user_data_path}")
  tags = merge(var.default_tags,
    {
      "Name" = "amzlnx-${count.index + 1}"
    }
  )
}
