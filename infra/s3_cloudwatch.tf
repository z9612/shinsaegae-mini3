# 로그 저장용 S3 버킷 생성
resource "aws_s3_bucket" "s3_bucket" {
  bucket = "giun-terraform-log-bucket"
}

#Firehose 가 가지는 역할
resource "aws_iam_role" "firehose_role" {
  name               = "FirehosetoS3Role"
  assume_role_policy = <<-EOF
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

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
          "s3:AbortMultipartUpload",
          "s3:GetBucketLocation",
          "s3:GetObject",
          "s3:ListBucket",
          "s3:ListBucketMultipartUploads",
          "s3:PutObject"
      ],
      "Resource": [
          "${aws_s3_bucket.s3_bucket.arn}",
          "${aws_s3_bucket.s3_bucket.arn}/*"
      ]
    }
  ]
}
EOF
}

# Firehose IAM Policy를Role에 붙이기
resource "aws_iam_role_policy_attachment" "firehose_s3_policy_attachment" {
  policy_arn = aws_iam_policy.firehose_s3_policy.arn
  role       = aws_iam_role.firehose_role.name
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

#CloudWatch 의 역할
resource "aws_iam_role" "cloudwatchrole" {
  name               = "CWLtoKinesisFirehoseRole"
  assume_role_policy = <<EOF
{
  "Statement": {
    "Effect": "Allow",
    "Principal": { "Service": "logs.amazonaws.com" },
    "Action": "sts:AssumeRole"
  }
}
EOF
}

#CloudWatch 가 Firehose에 접근하는 정책
resource "aws_iam_policy" "cloudwatch_firehose_policy" {
  name        = "cloudwatch_firehose_policy"
  description = "Policy for allowing PutRecord action on Firehose"

  policy = <<-EOF
    {
      "Version": "2012-10-17",
      "Statement":[
        {
          "Effect":"Allow",
          "Action":["firehose:PutRecord"],
          "Resource":[
            "*"
          ]
        }
      ]
    }
  EOF
}

#CloudWatch IAM Policy를 Role에 붙이기
resource "aws_iam_role_policy_attachment" "cloudwatch_firehose_policy_attachment" {
  policy_arn = aws_iam_policy.cloudwatch_firehose_policy.arn
  role       = aws_iam_role.cloudwatchrole.name
}

# 구독 필터, cloudWatch Logs 그룹에서 발생하는 로그 이벤트를 선택해서 firehose로 전달
resource "aws_cloudwatch_log_subscription_filter" "log_subscription_filter" {
  name            = "firehose_subscription_filter"
  log_group_name  = aws_cloudwatch_log_group.terraform-lg.name
  filter_pattern  = ""
  destination_arn = aws_kinesis_firehose_delivery_stream.firehose_stream.arn
  role_arn        = aws_iam_role.cloudwatchrole.arn
}

