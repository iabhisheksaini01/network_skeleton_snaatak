output "subnet_ids" {
  value       = [for s in aws_subnet.subnet : s.id]
  description = "List of subnet IDs"
}

output "subnet_name_to_id_map" {
  value       = { for i, name in var.subnet_names : name => aws_subnet.subnet[i].id }
  description = "Map of subnet names to IDs"
}

output "public_subnet_ids" {
  value       = [for i in var.public_subnet_indexes : aws_subnet.subnet[i].id]
  description = "List of public subnet IDs"
}

output "private_subnet_ids" {
  value       = [for i, s in aws_subnet.subnet : s.id if !contains(var.public_subnet_indexes, i)]
  description = "List of private subnet IDs"
}

