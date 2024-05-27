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
  backend "s3" {
    bucket = "bcktpfraicterraform001"
    key    = "tfstate/openlz/core/openlz-core.compartments.tfstate"
    region = "eu-amsterdam-1"
    endpoints = {
      s3 = "https://ax7yjiuzhoio.compat.objectstorage.eu-amsterdam-1.oraclecloud.com"
    }
  }
}

