#HU_compartment
data "oci_identity_compartment" "parent" {
  id = "HU_compartment"
}

#cmp-root-openlz
resource "oci_identity_compartment" "test_compartment" {
  #Required
  compartment_id = data.oci_identity_compartment.parent.id
  description    = "Intermediate Root Compartment for the OpenLZ Project"
  name           = "cmp-root-openlz"

  freeform_tags = {
    "Team"      = "Industry Cloud"
    "Project"   = "OpenLZ"
    "Terraform" = "true"
  }
}