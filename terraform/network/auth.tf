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
    conn_str = "postgres://rn47x2kesus3kbbiylxgrjsl6dzdwq-primary.postgresql.eu-amsterdam-1.oc1.oraclecloud.com/terraform_backend"
  }
}

data "terraform_remote_state" "cmp" {
  backend = "s3"
  config = {
    bucket = "bcktpfraicterraform001"
    key    = "tfstate/openlz/core/openlz-core.compartments.tfstate"
    endpoints = {
      s3 = "https://ax7yjiuzhoio.compat.objectstorage.eu-amsterdam-1.oraclecloud.com"
    }
    skip_region_validation      = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_requesting_account_id  = true
    skip_region_validation      = true
    skip_s3_checksum            = true
    use_path_style              = true
  }
}
