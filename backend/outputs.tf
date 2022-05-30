output "log_bucket" {
  value = aws_s3_bucket.log_bucket.bucket
}

output "log_bucket_id" {
  value = aws_s3_bucket.log_bucket.id
}