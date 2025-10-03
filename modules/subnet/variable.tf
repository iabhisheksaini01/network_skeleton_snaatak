variable "vpc_id" { type = string }
variable "subnet_names" { type = list(string) }
variable "subnet_cidrs" { type = list(string) }
variable "subnet_azs" { type = list(string) }
variable "public_subnet_indexes" { type = list(number) }
variable "env" { type = string }
variable "project_name" { type = string }
variable "common_tags" { type = map(string) }

