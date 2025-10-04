# VPC Configuration
vpc_cidr             = "10.0.0.0/16"
enable_dns_support   = true
enable_dns_hostnames = true
instance_tenancy     = "default"

# Project Details
region       = "us-east-1"
project_name = "myapp"
env          = "dev"
owner        = "DevOps Team"

# Subnet Configuration
subnet_names = ["public-1a", "public-1b", "private-1a", "private-1b"]
subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24", "10.0.11.0/24", "10.0.12.0/24"]
subnet_azs   = ["us-east-1a", "us-east-1b", "us-east-1a", "us-east-1b"]
public_subnet_indexes = [0, 1]

# Route Table Configuration
public_rt_cidr_block  = "0.0.0.0/0"
private_rt_cidr_block = "0.0.0.0/0"

# NACL Configuration
create_nacl = true
nacl_names  = ["public", "private"]

nacl_rules = {
  public = {
    subnet_indexes = [0, 1]
    ingress_rules = [
      {
        rule_no    = 100
        protocol   = "tcp"
        action     = "allow"
        cidr_block = "0.0.0.0/0"
        from_port  = 80
        to_port    = 80
      },
      {
        rule_no    = 110
        protocol   = "tcp"
        action     = "allow"
        cidr_block = "0.0.0.0/0"
        from_port  = 443
        to_port    = 443
      },
      {
        rule_no    = 120
        protocol   = "tcp"
        action     = "allow"
        cidr_block = "0.0.0.0/0"
        from_port  = 22
        to_port    = 22
      }
    ]
    egress_rules = [
      {
        rule_no    = 100
        protocol   = "-1"
        action     = "allow"
        cidr_block = "0.0.0.0/0"
        from_port  = 0
        to_port    = 0
      }
    ]
  }
  private = {
    subnet_indexes = [2, 3]
    ingress_rules = [
      {
        rule_no    = 100
        protocol   = "-1"
        action     = "allow"
        cidr_block = "10.0.0.0/16"
        from_port  = 0
        to_port    = 0
      }
    ]
    egress_rules = [
      {
        rule_no    = 100
        protocol   = "-1"
        action     = "allow"
        cidr_block = "0.0.0.0/0"
        from_port  = 0
        to_port    = 0
      }
    ]
  }
}

# Security Group Configuration
create_sg = true
sg_names  = ["alb", "web", "app"]

security_groups_rule = {
  alb = {
    ingress_rules = [
      {
        description = "Allow HTTP from internet"
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      },
      {
        description = "Allow HTTPS from internet"
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
    egress_rules = [
      {
        description = "Allow all outbound"
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
  }
  web = {
    ingress_rules = [
      {
        description    = "Allow HTTP from ALB"
        from_port      = 80
        to_port        = 80
        protocol       = "tcp"
        source_sg_names = ["alb"]
      },
      {
        description = "Allow SSH from bastion"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["10.0.0.0/16"]
      }
    ]
    egress_rules = [
      {
        description = "Allow all outbound"
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
  }
  app = {
    ingress_rules = [
      {
        description     = "Allow traffic from web tier"
        from_port       = 8080
        to_port         = 8080
        protocol        = "tcp"
        source_sg_names = ["web"]
      }
    ]
    egress_rules = [
      {
        description = "Allow all outbound"
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
  }
}

# ALB Configuration
create_alb          = true
alb_name            = "web-alb"
lb_internal         = false
lb_type             = "application"
lb_enable_deletion  = false

# Route53 Configuration
create_route53_record = false
domain_name          = ""
subdomain_name       = ""

# VPC Peering Configuration
enable_vpc_peering    = false
peer_vpc_id           = ""
peer_vpc_cidr         = ""
peer_route_table_ids  = []

# Common Tags
common_tags = {
  Terraform   = "true"
  Environment = "dev"
  Project     = "myapp"
  ManagedBy   = "Terraform"
}
