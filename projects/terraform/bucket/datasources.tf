data "aws_s3_bucket" "main" {
  bucket = "${var.bucket_name}-${terraform.workspace}"

  depends_on = [ aws_s3_bucket.main ]
}