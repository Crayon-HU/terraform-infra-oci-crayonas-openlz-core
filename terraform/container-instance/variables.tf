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

variable "project_name" {}
variable "subnet_ocid" {}
variable "compartment_ocid" {}
variable "private_ip" {}
variable "aws_access_key_id_secret_ocid" {}
variable "aws_secret_access_key_secret_ocid" {}
