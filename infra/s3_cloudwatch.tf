# 로그 저장용 S3 버킷 생성
resource "aws_s3_bucket" "s3_bucket" {
  bucket = "giun-terraform-log-bucket"
}

# CloudWatch Log Group 생성
resource "aws_cloudwatch_log_group" "terraform-lg" {
  name = "terraform-log-group"
}

# Firehose 생성
resource "aws_kinesis_firehose_delivery_stream" "firehose_stream" {
  name        = "cloudwatch_logs_to_s3"
  destination = "extended_s3"

  extended_s3_configuration {
    role_arn           = aws_iam_role.firehose_role.arn
    bucket_arn         = aws_s3_bucket.s3_bucket.arn
    compression_format = "UNCOMPRESSED"
    prefix             = "firehose_logs/"
  }

  depends_on = [aws_cloudwatch_log_group.terraform-lg]
}

# 구독 필터, cloudWatch Logs 그룹에서 발생하는 로그 이벤트를 선택해서 firehose로 전달
resource "aws_cloudwatch_log_subscription_filter" "log_subscription_filter" {
  name            = "firehose_subscription_filter"
  log_group_name  = aws_cloudwatch_log_group.terraform-lg.name
  filter_pattern  = ""
  destination_arn = aws_kinesis_firehose_delivery_stream.firehose_stream.arn
  role_arn        = aws_iam_role.cloudwatchrole.arn
}

