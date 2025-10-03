output "alb_arn" {
  value = var.create_alb ? aws_lb.alb[0].arn : null
}

output "alb_dns" {
  value = var.create_alb ? aws_lb.alb[0].dns_name : null
}

output "alb_zone_id" {
  value = var.create_alb ? aws_lb.alb[0].zone_id : null
}

