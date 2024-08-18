# Create the security group rules
resource "aws_security_group_rule" "ingress" {
  for_each = { for idx, rule in local.ingress_rules : "sg-013b8397adc7f8cec-${rule.from_port}" => rule }

  type              = "ingress"
  security_group_id = "sg-013b8397adc7f8cec"
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol
  cidr_blocks       = each.value.cidr_blocks
  description       = "sg-013b8397adc7f8cec-${each.value.from_port}"
}

# Create the security group rules
resource "aws_security_group_rule" "egress" {
  for_each = { for idx, rule in local.egress_rules : "sg-013b8397adc7f8cec-${rule.from_port}-egress" => rule }

  type              = "egress"
  security_group_id = "sg-013b8397adc7f8cec"
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol
  cidr_blocks       = each.value.cidr_blocks
  description       = "sg-013b8397adc7f8cec-${each.value.from_port}-egress"
}