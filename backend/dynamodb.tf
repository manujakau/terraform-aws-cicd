resource "aws_dynamodb_table" "tf_lock_state" {
  name = var.dynamo_db_table

  billing_mode = "PAY_PER_REQUEST"

  hash_key = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name      = var.dynamo_db_table
    Terraform = "true"
  }
}