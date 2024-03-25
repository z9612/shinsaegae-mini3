#!/bin/bash
sudo dnf install nginx -y
sudo systemctl enable nginx --now
echo "Hello, World" > /usr/share/nginx/html/index.html

#cloud-watch-agent
sudo dnf install -y amazon-cloudwatch-agent
sudo mkdir -p /opt/aws/amazon-cloudwatch-agent/etc
sudo cat << CWAgentConfig > /opt/aws/amazon-cloudwatch-agent/bin/config.json
{
	"agent": {
		"metrics_collection_interval": 60,
		"run_as_user": "root"
	},
	"logs": {
		"logs_collected": {
			"files": {
				"collect_list": [
					{
						"file_path": "/var/log/nginx/access.log",
						"log_group_class": "STANDARD",
						"log_group_name": "terraform-log-group",
						"log_stream_name": "{instance_id}",
						"retention_in_days": -1
					}
				]
			}
		}
	},
	"metrics": {
		"aggregation_dimensions": [
			[
				"InstanceId"
			]
		],
		"append_dimensions": {
			"AutoScalingGroupName": "\${aws:AutoScalingGroupName}",
			"ImageId": "\${aws:ImageId}",
			"InstanceId": "\${aws:InstanceId}",
			"InstanceType": "\${aws:InstanceType}"
		},
		"metrics_collected": {
			"cpu": {
				"measurement": [
					"cpu_usage_idle",
					"cpu_usage_iowait",
					"cpu_usage_user",
					"cpu_usage_system"
				],
				"metrics_collection_interval": 60,
				"resources": [
					"*"
				],
				"totalcpu": false
			},
			"disk": {
				"measurement": [
					"used_percent",
					"inodes_free"
				],
				"metrics_collection_interval": 60,
				"resources": [
					"*"
				]
			},
			"diskio": {
				"measurement": [
					"io_time",
					"write_bytes",
					"read_bytes",
					"writes",
					"reads"
				],
				"metrics_collection_interval": 60,
				"resources": [
					"*"
				]
			},
			"mem": {
				"measurement": [
					"mem_used_percent"
				],
				"metrics_collection_interval": 60
			},
			"netstat": {
				"measurement": [
					"tcp_established",
					"tcp_time_wait"
				],
				"metrics_collection_interval": 60
			},
			"statsd": {
				"metrics_aggregation_interval": 60,
				"metrics_collection_interval": 10,
				"service_address": ":8125"
			},
			"swap": {
				"measurement": [
					"swap_used_percent"
				],
				"metrics_collection_interval": 60
			}
		}
	}
}
CWAgentConfig

sudo dnf install collectd -y
# Start CloudWatch Agent
cd /opt/aws/amazon-cloudwatch-agent/bin
sudo ./amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -s -c file:./config.json

# Sudoers 수정
sudo sed -i '/^%wheel\s*ALL=(ALL)\s*ALL/s/^/#/' /etc/sudoers
echo '%wheel ALL=(ALL) NOPASSWD: ALL' | sudo EDITOR='tee -a' visudo
sudo usermod -aG wheel ec2-user

# SSH 설정
echo "PubkeyAuthentication yes" | sudo tee -a /etc/ssh/sshd_config
sudo systemctl restart sshd
