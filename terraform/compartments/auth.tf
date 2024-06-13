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
    bucket = "tfstate-bucket-rdoxii"
    region = "eu-amsterdam-1"

    skip_region_validation      = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    # skip_requesting_account_id  = true
    # skip_s3_checksum            = true

    endpoints = {
      s3 = "https://ax7yjiuzhoio.compat.objectstorage.eu-amsterdam-1.oraclecloud.com"
      dynamodb = "https://dhl3zddumkimn2micut3c6jjpm.apigateway.eu-amsterdam-1.oci.customer-oci.com"
    }
    key = "compartments.tfstate"
    dynamodb_table = "s3-locking-demo"
  }
}
