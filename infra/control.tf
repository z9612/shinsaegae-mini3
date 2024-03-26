resource "aws_instance" "control" {
  ami                         = "ami-00b23009cd61da5c9"
  instance_type               = "t3.large"
  vpc_security_group_ids      = [aws_security_group.control-sg.id]
  key_name                    = aws_key_pair.project-key.key_name
  subnet_id                   = aws_subnet.public_subnets[1].id
  associate_public_ip_address = true
 
  #contorl node 에는 Admin Access 적용
  iam_instance_profile = "adminAccess"

  tags = {
    Name = "control-node"
  }
}
