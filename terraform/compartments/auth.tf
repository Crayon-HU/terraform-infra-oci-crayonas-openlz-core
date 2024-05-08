#Providers
provider "oci" {
  tenancy_ocid = var.TENANCY_OCID
  user_ocid    = var.USER_OCID
  private_key  = var.PRIVATE_KEY
  fingerprint  = var.FINGERPRINT
  region       = "eu-frankfurt-1"
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
    bucket         = var.S3_BUCKET
    key            = "tfstate/openlz-core/openlz-core.compartments.tfstate"
    region         = "eu-frankfurt-1"
    endpoints = {
      s3 = var.S3_ENDPOINT
    }
  }
}