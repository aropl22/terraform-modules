resource "aws_s3_bucket" "bucket" {
  bucket        = var.s3_bucket_name
  force_destroy = true #all objects should be deleted from the bucket when the bucket is destroyed 
                       #so that the bucket can be destroyed without error
  tags = merge(
    var.default_tags,
    {
      "Name" = "${var.s3_bucket_name}"
    }
  )
}

resource "aws_s3_bucket_public_access_block" "bucket" {
  bucket = aws_s3_bucket.bucket

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

data "aws_iam_policy_document" "bucket_policy" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["arn:aws:s3:::${var.s3_bucket_name}/*"]

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    condition {
      test     = "StringEquals"
      variable = "aws:ReferencedResource/FunctionName"
      values   = ["${var.lambda_name}"]
    }
  }
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.bucket.id
  policy = file("./policy/S3ReadOnlyFrom Lambda.json")
  #policy = data.aws_iam_policy_document.s3_policy.json
}
