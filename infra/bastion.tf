resource "aws_instance" "bastion" {
 ami = "ami-02c956980e9e063e5"
 instance_type = "t3.large"
 vpc_security_group_ids = [aws_security_group.terrarform-bastion-sg.id]
 key_name = aws_key_pair.project-key.key_name
 subnet_id = aws_subnet.public_subnets[0].id
 associate_public_ip_address = true
 
	tags = {
	 Name = "bastion-instance"
	}
}
