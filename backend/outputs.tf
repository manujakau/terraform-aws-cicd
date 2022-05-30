output "log_bucket" {
  value = aws_s3_bucket.log_bucket.bucket
}

output "log_bucket_id" {
  value = aws_s3_bucket.log_bucket.id
}

output "codebuild_iam_role_arn" {
  value = aws_iam_role.codebuild_iam_role.arn
}