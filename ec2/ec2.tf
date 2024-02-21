data "aws_ami" "ubuntu" {
  most_recent = true
  owners = ["099720109477"] # Canonical  
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_ami" "amazonlinux3" {
  most_recent = true
  owners = ["137112412989"] # Amazon
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

data "aws_ami" "windows2022" {
  most_recent = true
  owners = ["801119661308"] # Microsoft
  filter {
    name   = "name"
    values = ["Windows_Server-2022-English-Full-Base-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "ubuntu" {
  count = var.ubuntu_ec2[0] ? var.ubuntu_ec2[1] : 0
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.ubuntu_ec2[2]
  key_name = "${var.key_name}"
  associate_public_ip_address = true
  vpc_security_group_ids = var.vpc_security_group_ids
  subnet_id = module.subnet1.subnet_id

   tags = merge(var.default_tags,
    {
      "Name" = "ubuntu-${count.index}"
    }
  )
}

resource "aws_instance" "amzlnx" {
  count = var.amzlnx_ec2[0] ? var.amzlnx_ec2[1] : 0
  ami           = data.aws_ami.amazonlinux3.id
  instance_type = var.amzlnx_ec2[2]
  key_name = "${var.key_name}"
  associate_public_ip_address = true
  vpc_security_group_ids = var.vpc_security_group_ids
  subnet_id = module.subnet1.subnet_id
  tags = merge(var.default_tags,
    {
      "Name" = "amzlnx-${count.index}"
    }
  )
}

resource "aws_instance" "win2022" {
  count = var.windows_ec2[0] ? var.windows_ec2[1] : 0
  ami           = data.aws_ami.windows2022.id
  instance_type = var.windows_ec2[0]
  key_name = "${var.key_name}"
  associate_public_ip_address = true
  vpc_security_group_ids = var.vpc_security_group_ids
  subnet_id = module.subnet1.subnet_id
  get_password_data = true # wait for password data to become available and retrieve it
  user_data = "${file("./scripts/configure_ssh.ps1")}"
  tags = merge(var.default_tags,
    {
      "Name" = "win2022-${count.index}"
    }
  )
}
