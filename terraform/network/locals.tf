locals {
  tags = {
    "Team"      = "Industry Cloud"
    "Project"   = "OpenLZ"
    "Terraform" = "true"
  }
  root_compartment_id = "ocid1.tenancy.oc1..aaaaaaaagt7ufsqo7ydlyrzeke6rzxllqtqlhayvhrnoi4vhtyxtq3deo7ia"
  # mgmt_compartment_id = data.terraform_remote_state.cmp.outputs.core_compartments.cmp_mgmt.compartment_id
}
