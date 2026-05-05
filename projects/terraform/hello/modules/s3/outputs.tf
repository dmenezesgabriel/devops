output "bucket_domain_name" {
  value = aws_s3_bucket.bucket.bucket_domain_name
  sensitive = false
}

output "bucket_id" {
  value = aws_s3_bucket.bucket.id
  sensitive = false
}
