resource "aws_s3_bucket" "main" {
    bucket = "${var.bucket_name}-${terraform.workspace}"

    tags = {
        project = "nice-iac"
        iac = true
        environment = "${terraform.workspace}"
    }
}