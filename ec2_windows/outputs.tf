output "win2022_public_ip" {
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
}

#Get base64 password and put it in a file called pwdbase64.txt
#Run this command to decode the base64 to bin file
#certutil -decode pwdbase64.txt password.bin
#Run this command to decrypt your password.bin
#openssl rsautl -decrypt -inkey privatekey.openssh -in password.bin