#Virtual network
resource "oci_core_vcn" "vNet" {
  compartment_id = var.compartment_id
  cidr_blocks    = var.vcn-cidr_blocks
  dns_label      = var.vcn_dns_label
  display_name   = var.vcn_dns_label
}
resource "oci_core_internet_gateway" "IGW" {
  compartment_id = var.compartment_id
  display_name   = "IG for ${oci_core_vcn.vNet.dns_label}"
  vcn_id         = oci_core_vcn.vNet.id
}
#Route table
resource "oci_core_route_table" "public-RT" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.vNet.id
  display_name   = "Public Route Table for ${oci_core_vcn.vNet.dns_label}"
  route_rules {
    destination       = "0.0.0.0/0"
    network_entity_id = oci_core_internet_gateway.IGW.id
  }
}
#Subnet
resource "oci_core_subnet" "subnet" {
  compartment_id = var.compartment_id
  cidr_block     = cidrsubnet(oci_core_vcn.vNet.cidr_blocks[0], 9, 1)
  display_name   = var.dns_label
  dns_label      = var.dns_label
  vcn_id         = oci_core_vcn.vNet.id
  route_table_id = oci_core_route_table.public-RT.id
}

#Network security groups and rules
resource "oci_core_network_security_group" "NSG-1" {
  compartment_id = var.compartment_id
  display_name   = "Default Security Group for ${oci_core_vcn.vNet.dns_label}"
  vcn_id         = oci_core_vcn.vNet.id

  freeform_tags = {
    key      = "HNG12"
    tag-name = "Stage 4"
  }
}
resource "oci_core_network_security_group_security_rule" "allow-ssh" {
  network_security_group_id = oci_core_network_security_group.NSG-1.id
  direction                 = "INGRESS"
  protocol                  = "6"
  source                    = "0.0.0.0/0"

  tcp_options {
    destination_port_range {
      min = 22
      max = 22
    }
  }
}
resource "oci_core_network_security_group_security_rule" "allow-http" {
  network_security_group_id = oci_core_network_security_group.NSG-1.id
  direction                 = "INGRESS"
  protocol                  = "6"
  source                    = "0.0.0.0/0"

  tcp_options {
    destination_port_range {
      min = 80
      max = 80
    }
  }
}
resource "oci_core_network_security_group_security_rule" "allow-https" {
  network_security_group_id = oci_core_network_security_group.NSG-1.id
  direction                 = "INGRESS"
  protocol                  = "6"
  source                    = "0.0.0.0/0"

  tcp_options {
    destination_port_range {
      min = 443
      max = 443
    }
  }
}
resource "oci_core_network_security_group_security_rule" "allow-8000" {
  network_security_group_id = oci_core_network_security_group.NSG-1.id
  direction                 = "INGRESS"
  protocol                  = "6"
  source                    = "0.0.0.0/0"

  tcp_options {
    destination_port_range {
      min = 8000
      max = 8000
    }
  }
}
resource "oci_core_network_security_group_security_rule" "allow-outbound" {
  network_security_group_id = oci_core_network_security_group.NSG-1.id
  direction                 = "EGRESS"
  protocol                  = "all"
  destination               = "0.0.0.0/0"
}
