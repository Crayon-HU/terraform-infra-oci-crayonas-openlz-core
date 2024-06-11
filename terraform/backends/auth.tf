#Providers
provider "oci" {
  tenancy_ocid = var.TENANCY_OCID
  user_ocid    = var.USER_OCID
  private_key  = var.PRIVATE_KEY
  fingerprint  = var.FINGERPRINT
  region       = "eu-amsterdam-1"
}

provider "postgresql" {
  host            = var.POSTGRES_SERVER_IP
  port            = var.POSTGRES_SERVER_PORT
  username        = var.POSTGRES_ADMIN_USERNAME
  password        = var.POSTGRES_ADMIN_PASSWORD
  sslmode         = "require"
  connect_timeout = 15
}

terraform {
  required_version = ">= 1.6.0"
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "5.38.0"
    }
    postgresql = {
      source = "cyrilgdn/postgresql"
      version = "1.22.0"
    }
  }
  backend "pg" {
    conn_str = "postgres://pxe2wx6joe2zfcn7xdtad5hyqydi5q-primary.postgresql.eu-amsterdam-1.oc1.oraclecloud.com/core" #New
    # conn_str = "postgres://rn47x2kesus3kbbiylxgrjsl6dzdwq-primary.postgresql.eu-amsterdam-1.oc1.oraclecloud.com/core" #Old
  }
}




