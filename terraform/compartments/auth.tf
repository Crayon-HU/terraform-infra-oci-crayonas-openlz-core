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
    endpoint = "https://ax7yjiuzhoio.compat.objectstorage.eu-amsterdam-1.oraclecloud.com"
    dynamodb_endpoint = "https://cbwpnkclljkw26rjvgi3kjdmoe.apigateway.eu-amsterdam-1.oci.customer-oci.com"
    key = "compartments.tfstate"
    dynamodb_table = "core"
  }
}
