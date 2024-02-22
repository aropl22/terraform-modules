output "ubuntu_public_ip" {
  value = {
    for instance in aws_instance.ubuntu :
    instance.id => instance.public_ip
  }
}
