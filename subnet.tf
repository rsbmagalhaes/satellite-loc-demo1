############################
# Subnets
############################

locals {
  ZONES = ["${var.region}-1", "${var.region}-2", "${var.region}-3"]
}

resource "ibm_is_subnet" "subnets" {
  count                    = 3
  name                     = "subnet-demo-satellite-${count.index + 1}"
  vpc                      = ibm_is_vpc.vpc-instance.id
  zone                     = local.ZONES[count.index]
  total_ipv4_address_count = 128
  resource_group           = data.ibm_resource_group.rg.id
}

# # Subnet 
# resource "ibm_is_subnet" "subnet1" {
#   name                     = "${local.BASENAME}-subnet1"
#   vpc                      = ibm_is_vpc.vpc-instance.id
#   zone                     = local.ZONE1
#   total_ipv4_address_count = 128
#   resource_group           = data.ibm_resource_group.rg.id
# }

# # Subnet 2
# resource "ibm_is_subnet" "subnet2" {
#   name                     = "${local.BASENAME}-subnet2"
#   vpc                      = ibm_is_vpc.vpc-instance.id
#   zone                     = local.ZONE2
#   total_ipv4_address_count = 128
#   resource_group           = data.ibm_resource_group.rg.id
# }

# # Subnet 3
# resource "ibm_is_subnet" "subnet3" {
#   name                     = "${local.BASENAME}-subnet3"
#   vpc                      = ibm_is_vpc.vpc-instance.id
#   zone                     = local.ZONE3
#   total_ipv4_address_count = 128
#   resource_group           = data.ibm_resource_group.rg.id
# }

