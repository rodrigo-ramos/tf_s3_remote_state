output "s3_remote_state_dns" {
  value = aws_s3_bucket.lc_remote_state.bucket_domain_name
}
output "s3_remote_state_id" {
  value = aws_s3_bucket.lc_remote_state.id
}