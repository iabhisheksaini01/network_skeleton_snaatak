variable "vpc_cidr" { type = string }
variable "enable_dns_support" { type = bool }
variable "enable_dns_hostnames" { type = bool }
variable "instance_tenancy" { type = string }




variable "region" { type = string }
variable "project_name" { type = string }
variable "env" { type = string }
variable "owner" { type = string }




variable "subnet_names" { type = list(string) }
variable "subnet_cidrs" { type = list(string) }
variable "subnet_azs" { type = list(string) }
variable "public_subnet_indexes" { type = list(number) }

variable "public_route_table" { type = string }
variable "private_route_table" { type = string }

variable "public_rt_cidr_block" { type = string }
variable "private_rt_cidr_block" { type = string }

variable "create_nacl" { type = bool }
variable "nacl_names" { type = list(string) }
variable "nacl_rules" { type = map(any) }

variable "create_sg" { type = bool }
variable "sg_names" { type = list(string) }
variable "security_groups_rule" { type = map(any) }

variable "create_alb" { type = bool }
variable "alb_name" { type = string }
variable "lb_internal" { type = bool }
variable "lb_type" { type = string }
variable "lb_enable_deletion" { type = bool }

variable "create_route53_record" { type = bool }
variable "domain_name" { type = string }
variable "subdomain_name" { type = string }

variable "enable_vpc_peering" { type = bool }
variable "peer_vpc_id" { type = string }
variable "peer_vpc_cidr" { type = string }
variable "peer_route_table_ids" { type = list(string) }

variable "common_tags" { type = map(string) }

variable "eip_domain" { type = string }
