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

#Config Variables
variable "core_compartments" {}
variable "open_compartments" {}

variable "POSTGRES_SERVER_IP" {}
variable "POSTGRES_SERVER_PORT" {} 
variable "POSTGRES_ADMIN_USERNAME" {}
variable "POSTGRES_ADMIN_PASSWORD" {}