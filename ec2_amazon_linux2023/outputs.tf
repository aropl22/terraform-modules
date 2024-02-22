
output "amzlnx_public_ip" {
  #value = (aws_instance.amzlnx[*].public_ip)
  value = {
    for instance in aws_instance.amzlnx :
    instance.id => instance.public_ip
  }
}
