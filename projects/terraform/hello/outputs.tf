output "s3_bucket_name" {
  value     = module.s3.bucket_domain_name
  sensitive = false
}
