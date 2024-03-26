resource "aws_instance" "control" {
  ami                         = "ami-0b963ba6ddc7de2c3"
  instance_type               = "t3.large"
  vpc_security_group_ids      = [aws_security_group.control-sg.id]
  key_name                    = aws_key_pair.project-key.key_name
  subnet_id                   = aws_subnet.public_subnets[1].id
  associate_public_ip_address = true
  iam_instance_profile        = "adminAccess"  # contorl node 에는 Admin Access 적용

  user_data = <<-EOF
                #!/bin/bash
                sudo yum install -y mysql awscli
                export rds_dns=$(aws rds describe-db-instances --db-instance-identifier terraform-mysql --query 'DBInstances[0].Endpoint.Address' --output text)
                git clone https://github.com/z9612/shinsaegae-mini3.git
                sudo mysql -u nana -h $rds_dns terraformdb < /home/ec2-user/shinsaegae-mini3/Dump20240118/project_user.sql -p nana1234
              EOF

  tags = {
    Name = "control-node"
  }
}
