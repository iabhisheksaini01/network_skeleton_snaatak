variable "public_subnet_id" { type = string }
variable "eip_domain" { type = string }
variable "igw_id" { type = string } # dependency to ensure IGW exists
variable "project_name" { type = string }
variable "env" { type = string }
variable "common_tags" { type = map(string) }

