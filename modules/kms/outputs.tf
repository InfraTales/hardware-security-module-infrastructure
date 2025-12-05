output "key_ids" {
  description = "KMS Key IDs"
  value = {
    general  = aws_kms_key.general.id
    database = aws_kms_key.database.id
    s3       = aws_kms_key.s3.id
  }
}

output "key_arns" {
  description = "KMS Key ARNs"
  value = {
    general  = aws_kms_key.general.arn
    database = aws_kms_key.database.arn
    s3       = aws_kms_key.s3.arn
  }
}

output "alias_names" {
  description = "KMS Alias Names"
  value = {
    general  = aws_kms_alias.general.name
    database = aws_kms_alias.database.name
    s3       = aws_kms_alias.s3.name
  }
}
