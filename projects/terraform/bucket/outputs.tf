output "bucket_domain_name" {
  value = data.aws_s3_bucket.main.bucket_domain_name
  sensitive = false
}

output "bucket_region" {
  value = data.aws_s3_bucket.main.region
  sensitive = false
}