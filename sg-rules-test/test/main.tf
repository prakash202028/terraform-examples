# resource "aws_security_group" "agent_security_group" {
#   for_each    = var.enabled ? var.agent_sets : {}
#   name        = "${each.key}_security_group"
#   description = "Security group for ${each.key}"
#   vpc_id      = var.vpc_id
#
#   dynamic "ingress" {
#     for_each = each.value.ingress_ports
#     content {
#       from_port       = tonumber(ingress.value)
#       to_port         = tonumber(ingress.value)
#       protocol        = "tcp"
#       security_groups = var.agent_sets[each.key].security_group_ids
#       #       cidr_blocks = ["0.0.0.0/0"] # Update with appropriate CIDR blocks
#     }
#   }
#
#   dynamic "egress" {
#     for_each = each.value.egress_ports
#     content {
#       from_port   = tonumber(egress.value)
#       to_port     = tonumber(egress.value)
#       protocol    = "tcp"
#       cidr_blocks = ["0.0.0.0/0"] # Update with appropriate CIDR blocks
#     }
#   }
# }