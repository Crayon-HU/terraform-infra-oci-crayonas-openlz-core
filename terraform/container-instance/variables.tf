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

variable "project_name" {
  default = "scylladb"
}
variable "subnet_ocid" {
  default = "ocid1.subnet.oc1.eu-amsterdam-1.aaaaaaaavxq2fo4ilyaxe5s5oi4smteruiirekbftefn44ua265wg2famcta"
}
variable "private_ip" {
  default = "10.0.1.77"
}
