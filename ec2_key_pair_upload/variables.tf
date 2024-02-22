# When importing an existing key pair the public key material may be in any format supported by AWS.
# https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html#how-to-generate-your-own-key-and-import-it-to-aws

variable "public_key" {
  description = "Public Key"
  type        = string
}

variable "key_name" {
  description = "Key Pair Name"
  type        = string
}

variable "tags" {
  type = map(any)
}