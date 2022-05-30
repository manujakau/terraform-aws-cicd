resource "aws_s3_bucket_server_side_encryption_configuration" "state_bucket" {
  bucket = var.tfstate_bucket

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  versioning {
    enabled = true
  }

  tags = {
    Terraform = "true"
  }
}


resource "aws_s3_bucket_server_side_encryption_configuration" "log_bucket" {
  bucket = var.log_bucket
  acl    = "private"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}