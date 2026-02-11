output "bucket_name" {
  value       = aws_s3_bucket.website.bucket
  description = "Name of the S3 bucket hosting the site"
}

output "website_endpoint" {
  value       = aws_s3_bucket_website_configuration.website.website_endpoint
  description = "S3 static website endpoint (HTTP)"
}

output "website_url" {
  value       = "http://${aws_s3_bucket_website_configuration.website.website_endpoint}"
  description = "Full website URL"
}
