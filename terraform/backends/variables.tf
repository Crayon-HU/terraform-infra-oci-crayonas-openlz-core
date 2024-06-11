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
variable "POSTGRES_SERVER_IP" {
  sensitive = true
}
variable "POSTGRES_SERVER_PORT" {
  sensitive = true
} 
variable "POSTGRES_ADMIN_USERNAME" {
  sensitive = true
}