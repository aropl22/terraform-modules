output "ubuntu" {
  value = (aws_instance.instance1[*].public_ip)
}
output "amzlnx" {
  value = (aws_instance.instance2[*].public_ip)
}

output "win2022" {
  #value = one(aws_instance.instance3[*].public_ip)
  value = (aws_instance.instance3[*].public_ip)
}

output "win2022_Administrator_Password" {
   value = rsadecrypt((aws_instance.instance3[*].password_data), file(var.key_path))
     #[one(aws_instance.instance3[*].password_data)]
 }

#Get base64 password and put it in a file called pwdbase64.txt
#Run this command to decode the base64 to bin file
#certutil -decode pwdbase64.txt password.bin
#Run this command to decrypt your password.bin
#openssl rsautl -decrypt -inkey privatekey.openssh -in password.bin