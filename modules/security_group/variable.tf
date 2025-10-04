variable "vpc_id" { type = string }
variable "create_sg" { type = bool }
variable "sg_names" { type = list(string) }
variable "security_groups_rule" { type = map(any) }
variable "env" { type = string }
variable "common_tags" { type = map(string) }

