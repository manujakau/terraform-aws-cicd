output "codepipeline_artifact_bucket_arn" {
  value = aws_s3_bucket.codepipeline_artifact_bucket.arn
}

output "artifact_bucket_dependency" {
  value = aws_s3_bucket.codepipeline_artifact_bucket
}