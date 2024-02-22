data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical  
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "ubuntu" {
  count                       = var.ubuntu_ec2_count
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.ubuntu_ec2_instance_type
  key_name                    = var.key_name
  associate_public_ip_address = true
  vpc_security_group_ids      = var.vpc_security_group_ids
  subnet_id                   = var.subnet_id
  user_data                   = file("${var.ubuntu_user_data_path}")
  tags = merge(var.default_tags,
    {
      "Name" = "ubuntu-${count.index + 1}"
    }
  )
}