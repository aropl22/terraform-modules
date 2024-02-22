# Uploads local public key to AWS

Module declaration example:

```terraform
module "ec2_key_pair" {
  source     = "./ec2_key_pair"
  key_name   = var.key_name                     #key name
  public_key = file("${var.public_key_path}")   #path to local public key
  tags = merge(                                 #tags (in this example merged with default tags map(obj))
    var.default_tags,
    {
      "Name" = "${var.key_name}"
    }
  )
}
```
