resource "aws_launch_configuration" "web" {
  name_prefix          = "web-"
  image_id             = "ami-02c956980e9e063e5"
  instance_type        = "t2.micro"
  key_name             = aws_key_pair.project-key.key_name
  security_groups      = [aws_security_group.terrarform-asg-sg.id]
  user_data            = file("user-data-web.sh")
  iam_instance_profile = aws_iam_instance_profile.cwagent_profile.name #추가

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_launch_configuration" "was" {
  name_prefix     = "was-"
  image_id        = "ami-02c956980e9e063e5"
  instance_type   = "t2.micro"
  key_name        = aws_key_pair.project-key.key_name
  security_groups = [aws_security_group.terrarform-internal-asg-sg.id]
  
  iam_instance_profile = aws_iam_instance_profile.was_profile.name #추가
  lifecycle {
    create_before_destroy = true
  }
}
