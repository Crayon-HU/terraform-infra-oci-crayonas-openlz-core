#mgmnt compartment
resource "oci_core_vcn" "vcn" {
  cidr_blocks    = ["11.0.0.0/16"]
  dns_label      = "vcn"
  compartment_id = local.mgmt_compartment_id
  display_name   = "vcn-terraform"
}

output "vcn_id" {
  value = oci_core_vcn.vcn.id
}