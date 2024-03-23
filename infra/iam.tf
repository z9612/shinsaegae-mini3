#CloudWatch Agent Role
data "aws_iam_role" "cwagent_role" {
  name = "CWAgentRole"
}

resource "aws_iam_instance_profile" "cwagent_profile" {
  name = "CWAgentProfile"
  role = data.aws_iam_role.cwagent_role.name
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

#firehose IAM role 과 정책을 연결
resource "aws_iam_role_policy_attachment" "firehose_s3_policy_attachment" {
  policy_arn = aws_iam_policy.firehose_s3_policy.arn
  role       = aws_iam_role.firehose_role.name
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

