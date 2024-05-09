#HU_compartment
data "oci_identity_compartment" "parent" {
  id = "ocid1.compartment.oc1..aaaaaaaavjic26327yzpleqiu77qvfaxxjobtsuili265urpkh7ac63afo3q"
}

#cmp-root-openlz
resource "oci_identity_compartment" "root" {
  compartment_id = data.oci_identity_compartment.parent.id
  description    = "Intermediate Root Compartment for the OpenLZ Project"
  name           = "cmp-root-openlz"

  freeform_tags = local.tags
}

#Core Compartments
locals {
  enable_delete = false
  core_compartments = {
    security = {
      name          = "cmp-security"
      description   = "Security Compartment for the OpenLZ Project"
      enable_delete = local.enable_delete
      tags          = local.tags
    }
    hub = {
      name          = "cmp-hub"
      description   = "Hub Network Compartment for the OpenLZ Project"
      enable_delete = local.enable_delete
      tags          = local.tags
    }
    mgmt = {
      name          = "cmp-mgmt"
      description   = "Management Compartment for the OpenLZ Project"
      enable_delete = local.enable_delete
      tags          = local.tags
    }
  }

  #Operating Entity Compartments
  open_compartments = {
    open01 = {
      name          = "cmp-open01"
      description   = "Operating Entity 01 Compartment for the OpenLZ Project"
      enable_delete = local.enable_delete
      tags          = local.tags
    }
    open02 = {
      name          = "cmp-open02"
      description   = "Operating Entity 02 Compartment for the OpenLZ Project"
      enable_delete = local.enable_delete
      tags          = local.tags
    }
    open03 = {
      name          = "cmp-open03"
      description   = "Operating Entity 03 Compartment for the OpenLZ Project"
      enable_delete = local.enable_delete
      tags          = local.tags
    }
  }

  compartments = merge(local.core_compartments, local.open_compartments)

  all_compartments = merge({ for comp in oci_identity_compartment.core : comp.name => comp })
}

resource "oci_identity_compartment" "core" {
  for_each = local.compartments

  compartment_id = oci_identity_compartment.root.id
  description    = each.value.description
  name           = each.value.name
  enable_delete  = each.value.enable_delete
  freeform_tags  = each.value.tags
}


