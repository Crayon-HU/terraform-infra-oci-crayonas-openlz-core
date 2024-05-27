#Security Groups
data "oci_identity_groups" "root" {
    compartment_id = data.terraform_remote_state.cmp.outputs.root_compartment_id
}
# output "root_groups" {
#     value = data.oci_identity_groups.root
# }
