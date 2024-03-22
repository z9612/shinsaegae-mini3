resource "aws_db_instance" "terraform_rds" {
  identifier            = "terraform-mysql"
  allocated_storage     = 50
  max_allocated_storage = 100
  engine                = "mariadb"
  engine_version        = "10.5.20"
  instance_class        = "db.t3.large"
  db_name               = "terraformdb"
  username              = "nana"
  password              = "nana1234"
  multi_az              = true #다중 AZ로 가용성 올리기
  publicly_accessible   = false
  skip_final_snapshot   = true
  db_subnet_group_name  = aws_db_subnet_group.rds_subnet_group.name #db 서브넷 그룹을 명시해줘야 다중 AZ를 사용할 수 있음


  vpc_security_group_ids = [
    aws_security_group.terrarform-rds-sg.id
  ]


  tags = {
    Name = "TerraformDB"
  }
}
