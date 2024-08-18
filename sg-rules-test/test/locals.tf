# Generate a list of security group rules from the variable
locals {
  ingress_rules = flatten([
    for set_key, set_value in var.agent_sets : [
      for port in set_value.ingress_ports : {
        #         security_group_id = aws_security_group.sg.id
        from_port          = tonumber(port)
        to_port            = tonumber(port)
        protocol           = "tcp"
        cidr_blocks        = ["0.0.0.0/0"] # Adjust CIDR as needed
      }
    ]
  ])
}

## egress
# Generate a list of security group rules from the variable
locals {
  egress_rules = flatten([
    for key, value in var.agent_sets : [
      for port in value.egress_ports : {
        #         security_group_id = aws_security_group.sg.id
        from_port          = tonumber(port)
        to_port            = tonumber(port)
        protocol           = "tcp"
        cidr_blocks        = ["0.0.0.0/0"] # Adjust CIDR as needed
      }
    ]
  ])
}