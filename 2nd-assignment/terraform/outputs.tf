output "bucket_arn" {
  value = aws_s3_bucket.bucket.arn
}

output "instance_id" {
  value = aws_instance.web.id
}

output "db_instance_endpoint" {
  value = aws_db_instance.db.endpoint
}
