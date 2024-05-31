#Compartments
output "root_compartment_id" {
  value = local.root_compartment_id
}
output "parent_compartment_id" {
  value = data.oci_identity_compartment.parent.id
}
output "all_compartments" {
  value = local.all_compartments
}