#Users
# resource "oci_identity_user" "owner" {
#     #Required
#     compartment_id = var.tenancy_ocid
#     description = var.user_description
#     name = var.user_name

#     #Optional
#     defined_tags = {"Operations.CostCenter"= "42"}
#     email = var.user_email
#     freeform_tags = {"Department"= "Finance"}
# }