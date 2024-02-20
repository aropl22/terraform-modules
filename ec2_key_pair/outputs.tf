output "aws_key_pair_id" {
  value = aws_key_pair.terraform_key.id
}

output "aws_key_pair_name" {
  value = aws_key_pair.terraform_key.key_name
}