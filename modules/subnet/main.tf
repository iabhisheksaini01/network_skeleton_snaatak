resource "aws_subnet" "subnet" {
  count                   = length(var.subnet_names)
  vpc_id                  = var.vpc_id
  cidr_block              = var.subnet_cidrs[count.index]
  availability_zone       = var.subnet_azs[count.index]
  map_public_ip_on_launch = contains(var.public_subnet_indexes, count.index)

  tags = merge(var.common_tags, {
    Name        = "${var.env}-${var.project_name}-${var.subnet_names[count.index]}"
    Environment = var.env
  })
}

