# 로그 저장용 S3 버킷 생성
resource "aws_s3_bucket" "s3_bucket" {
  bucket = "giun-terraform-log-bucket"
}

# IAM 정책은 누가 어떤 것을 할 수 있는지를 정의
# CloudWatch Logs 서비스가 목표 S3 버킷에 객체를 업로드할 수 있는 권한이 포함
resource "aws_iam_policy" "s3_policy" {
  name = "allow-cloudwatch-logs-to-s3"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:PutObject"
      ],
      "Resource": [
        "${aws_s3_bucket.s3_bucket.arn}/*"
      ]
    }
  ]
}
POLICY
}

# CloudWatch Log Group
resource "aws_cloudwatch_log_group" "terraform-lg" {
  name = "terraform-log-group"
}

# Firehose IAM Role
resource "aws_iam_role" "firehose_role" {
  name               = "firehose_role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "firehose.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    },
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "logs.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

# Firehose가 S3에 쓸 수 있는 정책
resource "aws_iam_policy" "firehose_s3_policy" {
  name        = "firehose_s3_policy"
  description = "Allows Firehose to write to S3"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
       Action   = "firehose:*",
        Resource = "*"
      },
      {
        Effect = "Allow",
       Action   = "s3:*",
        Resource = "*"
      }
    ]
  })
}

# IAM Policy를Role에 붙이기 
resource "aws_iam_role_policy_attachment" "firehose_s3_policy_attachment" {
  policy_arn = aws_iam_policy.firehose_s3_policy.arn
  role       = aws_iam_role.firehose_role.name
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

# loudWatch Logs 그룹에서 발생하는 로그 이벤트를 선택하고, 해당 이벤트를 특정 대상으로 전송하는 규칙을 정의
resource "aws_cloudwatch_log_subscription_filter" "log_subscription_filter" {
  name            = "firehose_subscription_filter"
  log_group_name  = aws_cloudwatch_log_group.terraform-lg.name
  filter_pattern  = ""
  destination_arn = aws_kinesis_firehose_delivery_stream.firehose_stream.arn
  role_arn        = aws_iam_role.firehose_role.arn
}

