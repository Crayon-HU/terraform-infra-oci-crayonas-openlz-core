#Providers
provider "oci" {
  tenancy_ocid = var.TENANCY_OCID
  user_ocid    = var.USER_OCID
  private_key  = var.PRIVATE_KEY
  fingerprint  = var.FINGERPRINT
  region       = "eu-amsterdam-1"
}

terraform {
  required_version = ">= 1.6.0"
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "5.38.0"
    }
  }
  backend "pg" {
    conn_str = "postgres://rn47x2kesus3kbbiylxgrjsl6dzdwq-primary.postgresql.eu-amsterdam-1.oc1.oraclecloud.com/core"
  }
}