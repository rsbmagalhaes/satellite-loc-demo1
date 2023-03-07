# Security group
resource "ibm_is_security_group" "sg1" {
  name           = "${var.vpc_name}-sg1"
  vpc            = ibm_is_vpc.vpc-instance.id
  resource_group = data.ibm_resource_group.rg.id
}

# allow all incoming network traffic
resource "ibm_is_security_group_rule" "example-ingress_all" {
  group     = ibm_is_security_group.sg1.id
  direction = "inbound"
}

# allow all outgoing network traffic
resource "ibm_is_security_group_rule" "example-egress_all" {
  group     = ibm_is_security_group.sg1.id
  direction = "outbound"
}