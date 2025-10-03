resource "aws_route_table" "public" {
  vpc_id = var.vpc_id
  tags   = merge(var.common_tags, { Name = "${var.env}-${var.project_name}-public-rt" })
}

resource "aws_route_table" "private" {
  vpc_id = var.vpc_id
  tags   = merge(var.common_tags, { Name = "${var.env}-${var.project_name}-private-rt" })
}

resource "aws_route_table_association" "public_assoc" {
  count          = length(var.public_subnet_ids)
  subnet_id      = var.public_subnet_ids[count.index]
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private_assoc" {
  count          = length(var.private_subnet_ids)
  subnet_id      = var.private_subnet_ids[count.index]
  route_table_id = aws_route_table.private.id
}

resource "aws_route" "public" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = var.public_rt_cidr_block
  gateway_id             = var.igw_id
}

resource "aws_route" "private" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = var.private_rt_cidr_block
  nat_gateway_id         = var.nat_gateway_id
}

