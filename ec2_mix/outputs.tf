output "ubuntu" {
  #value = (aws_instance.ubuntu[*].public_ip)
  value = {
    for instance in aws_instance.ubuntu :
    instance.id => instance.public_ip
  }
}
output "amzlnx" {
  #value = (aws_instance.amzlnx[*].public_ip)
  value = {
    for instance in aws_instance.amzlnx :
    instance.id => instance.public_ip
  }
}

output "win2022" {
  #value = one(aws_instance.instance3[*].public_ip)
  value = {
    for instance in aws_instance.win2022 :
    instance.id => instance.public_ip
  }
}

output "win2022_Administrator_Password" {
  value = {
    for instance in aws_instance.win2022 :
    instance.id => rsadecrypt((instance.password_data), file("../certs/terraform-key/ssh-rsa.key.pem"))
  }
  #when only one instance [one(aws_instance.instance3[*].password_data)]
}

#Get base64 password and put it in a file called pwdbase64.txt
#Run this command to decode the base64 to bin file
#certutil -decode pwdbase64.txt password.bin
#Run this command to decrypt your password.bin
#openssl rsautl -decrypt -inkey privatekey.openssh -in password.bin