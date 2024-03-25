resource "aws_key_pair" "project-key" {
  key_name   = "project-key"
  public_key = file("./project-key.pub")
  tags = {
    Name = "project-key"
  }
}
