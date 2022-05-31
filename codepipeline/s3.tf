resource "aws_s3_bucket" "codepipeline_artifact_bucket" {
  bucket        = var.codepipeline_artifact_bucket
  force_destroy = true
}

resource "aws_s3_bucket_acl" "codepipeline_artifact_bucket" {
  bucket = aws_s3_bucket.codepipeline_artifact_bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "codepipeline_artifact_bucket" {
  bucket = aws_s3_bucket.codepipeline_artifact_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
