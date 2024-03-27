#!/bin/bash
sudo dnf install mariadb105 -y
sudo dnf install git -y
git clone https://github.com/z9612/shinsaegae-mini3.git
export rds_dns=$(aws rds describe-db-instances --db-instance-identifier terraform-mysql --query 'DBInstances[0].Endpoint.Address' --output text)
sudo mysql -u nana -h $rds_dns terraformdb < /home/ec2-user/shinsaegae-mini3/Dump20240118/project_user.sql -p nana1234
