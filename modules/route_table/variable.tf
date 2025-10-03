variable "vpc_id" { type = string }
variable "public_subnet_ids" { type = list(string) }
variable "private_subnet_ids" { type = list(string) }
variable "igw_id" { type = string }
variable "nat_gateway_id" { type = string }
variable "public_rt_cidr_block" { type = string }
variable "private_rt_cidr_block" { type = string }
variable "env" { type = string }
variable "project_name" { type = string }
variable "common_tags" { type = map(string) }

