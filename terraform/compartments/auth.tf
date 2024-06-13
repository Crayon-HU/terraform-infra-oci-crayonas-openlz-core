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
  # backend "pg" {
  #   conn_str = "postgres://pxe2wx6joe2zfcn7xdtad5hyqydi5q-primary.postgresql.eu-amsterdam-1.oc1.oraclecloud.com/core" #New
  #   # conn_str = "postgres://rn47x2kesus3kbbiylxgrjsl6dzdwq-primary.postgresql.eu-amsterdam-1.oc1.oraclecloud.com/core" #Old
  # }
  backend "s3" {
    bucket = "tf-state-bucket-bweoam"
    region = "eu-amsterdam-1"

    skip_region_validation      = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    # skip_requesting_account_id  = true
    # skip_s3_checksum            = true

    access_key = "4794d5525ffcdaf0421003566dcb7cea87d33ea0"
    secret_key = "5ZXaaQtZgdG9IWzQWzMfykqfq33odrAn7mQczliDqMo="

    endpoints = {
      s3 = "https://ax7yjiuzhoio.compat.objectstorage.eu-amsterdam-1.oraclecloud.com"
      dynamodb = "https://cbwpnkclljkw26rjvgi3kjdmoe.apigateway.eu-amsterdam-1.oci.customer-oci.com"
    }
    key = "compartments.tfstate"
    dynamodb_table = "s3-locking-demo"
  }
}
