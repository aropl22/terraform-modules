data "aws_ami" "windows2022" {
  most_recent = true
  owners      = ["801119661308"] # Microsoft
  filter {
    name   = "name"
    values = ["Windows_Server-2022-English-Full-Base-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "win2022" {
  count                       = var.windows_ec2_count
  ami                         = data.aws_ami.windows2022.id
  instance_type               = var.windows_ec2_instance_type
  key_name                    = var.key_name
  associate_public_ip_address = true
  vpc_security_group_ids      = var.vpc_security_group_ids
  subnet_id                   = var.subnet_id
  get_password_data           = true # wait for password data to become available and retrieve it
  user_data                   = file("./ec2/scripts/win_configure_ssh_server.ps1")
  #user_data = "${file("${var.windows_user_data_path}")}"
  tags = merge(var.default_tags,
    {
      "Name" = "win2022-${count.index + 1}"
    }
  )
}
