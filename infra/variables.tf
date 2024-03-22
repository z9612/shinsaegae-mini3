# 1. VPC Subnet variables
variable "public_subnet" {
 type = list(string)
 description = "Public Subnet CIDR values"
 default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet" {
 type = list(string)
 description = "Private Subnet CIDR values"
 default = ["10.0.11.0/24", "10.0.12.0/24"]
}

variable "rds_subnet" {
  type        = list(string)
  description = "RDS Subnet CIDR values"
  default     = ["10.0.21.0/24", "10.0.22.0/24"]
}

# 2.AZS variables
variable "azs" {
 type = list(string)
 description = "Availability Zones"
 default = ["ap-northeast-2a","ap-northeast-2c"]
}
