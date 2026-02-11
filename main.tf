provider "aws" {
  region = var.aws_region
}

# Random String Resource (6-char lowercase, no specials/uppercase)
resource "random_string" "suffix" {
  length  = 6
  lower   = true
  upper   = false
  special = false
}

# S3 Bucket (globally unique name required)
resource "aws_s3_bucket" "website" {
  bucket        = "lextech-s3-static-website-${random_string.suffix.result}"
  force_destroy = true
}

# Static Website Hosting configuration
resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.website.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

# Disable all public access blocks (lab requirement)
resource "aws_s3_bucket_public_access_block" "public" {
  bucket = aws_s3_bucket.website.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# Public read bucket policy (required for public website access)
data "aws_iam_policy_document" "public_read" {
  statement {
    sid     = "PublicReadGetObject"
    effect  = "Allow"
    actions = ["s3:GetObject"]

    principals {
      type        = "*"
      identifiers = ["*"]
    }

    resources = ["${aws_s3_bucket.website.arn}/*"]
  }
}

resource "aws_s3_bucket_policy" "public_read" {
  bucket = aws_s3_bucket.website.id
  policy = data.aws_iam_policy_document.public_read.json

  depends_on = [aws_s3_bucket_public_access_block.public]
}

# Upload html/*.html as text/html
locals {
  html_dir   = "${path.module}/html"
  html_files = fileset(local.html_dir, "*.html")
}

resource "aws_s3_object" "html" {
  for_each = local.html_files

  bucket       = aws_s3_bucket.website.id
  key          = each.value
  source       = "${local.html_dir}/${each.value}"
  content_type = "text/html"
  etag         = filemd5("${local.html_dir}/${each.value}")
}
