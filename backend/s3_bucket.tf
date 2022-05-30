resource "aws_s3_bucket" "state_bucket" {
  bucket = var.tfstate_bucket

  versioning {
    enabled = true
  }

  tags = {
    Terraform = "true"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "state_bucket" {
  bucket = aws_s3_bucket.state_bucket.id

    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
    }
  }
}


resource "aws_s3_bucket" "log_bucket" {
  bucket = var.log_bucket
  acl    = "private"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "log_bucket" {
  bucket = aws_s3_bucket.log_bucket.id

    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
    }
  }
}