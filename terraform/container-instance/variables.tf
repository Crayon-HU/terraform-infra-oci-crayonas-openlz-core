#TF_VAR_ Variables
variable "TENANCY_OCID" {
  sensitive = true
}
variable "USER_OCID" {
  sensitive = true
}
variable "PRIVATE_KEY" {
  #checkov:skip=CKV_SECRET_13: "Private Key sourced from env vars via action secret."
  sensitive = true
}
variable "FINGERPRINT" {
  sensitive = true
}

variable "AWS_ACCESS_KEY_ID" {
  sensitive = true
}
variable "AWS_SECRET_ACCESS_KEY" {
  sensitive = true
}

variable "project_name" {
  default = "scylladb"
}
variable "subnet_ocid" {
  default = "ocid1.subnet.oc1.eu-amsterdam-1.aaaaaaaavxq2fo4ilyaxe5s5oi4smteruiirekbftefn44ua265wg2famcta"
}
variable "private_ip" {}

# variable "containers" {
#     type = list(object({
#         display_name          = optional(string)
#         image_url             = string
#         environment_variables = optional(map(string))

#         command               = optional(list(string))
#         arguments             = optional(list(string))

#         volume_mounts         = optional(list(object({
#             volume_name = string
#             mount_path  = string
#         })))

#         resource_config = optional(map(object({
#             memory_limit_in_gbs = optional(number)
#             vcpus_limit         = optional(number)
#         })))

#         memory_limit_in_gbs   = optional(number)
#         vcpus_limit           = optional(number)

#         working_directory     = optional(string)
#     }))

#     description = "The containers to create on this container instance."
# }