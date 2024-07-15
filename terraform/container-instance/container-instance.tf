#HU_compartment
data "oci_identity_compartment" "parent" {
  id = "ocid1.compartment.oc1..aaaaaaaavjic26327yzpleqiu77qvfaxxjobtsuili265urpkh7ac63afo3q"
}

data "oci_identity_availability_domains" "local_ads" {

  compartment_id = data.oci_identity_compartment.parent.id
}

resource "oci_container_instances_container_instance" "demo_container_instance" {

  # create the container instance in AD1
  availability_domain      = data.oci_identity_availability_domains.local_ads.availability_domains.0.name
  compartment_id           = data.oci_identity_compartment.parent.id
  freeform_tags            = { "project-name" = var.project_name }
  display_name             = "${var.project_name}-container-instance"
  container_restart_policy = "ALWAYS"
  shape                    = "CI.Standard.A1.Flex"
  shape_config {

    memory_in_gbs = 6
    ocpus         = 1
  }

  vnics {
    #Required
    subnet_id             = var.subnet_ocid

    #Optional
    display_name          = "${var.project_name}-container-instance-vnic"
    is_public_ip_assigned = false
    nsg_ids               = []
    hostname_label = var.project_name
    private_ip = var.private_ip
    skip_source_dest_check = true
  }

  containers {
    image_url    = "scylladb/scylla:5.4"
    display_name = "ScyllaDB base image"
    arguments = "--listen-address=${var.private_ip},--rpc-address=${var.private_ip},--seed-provider-parameters seeds=${var.private_ip},--alternator-address=${var.private_ip},--alternator-port=8000,--alternator-write-isolation=always"
  }
}