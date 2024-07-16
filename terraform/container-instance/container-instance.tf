#HU_compartment
data "oci_identity_compartment" "parent" {
  id = var.compartment_ocid
}

data "oci_identity_availability_domains" "local_ads" {

  compartment_id = data.oci_identity_compartment.parent.id
}

data "oci_secrets_secretbundle" "AWS_ACCESS_KEY_ID_bundle" {
    #Required
    secret_id = var.aws_access_key_id_secret_ocid
}

data "oci_secrets_secretbundle" "AWS_SECRET_ACCESS_KEY_bundle" {
    #Required
    secret_id = var.aws_secret_access_key_secret_ocid
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
    hostname_label        = var.project_name
    private_ip            = var.private_ip
    skip_source_dest_check = true
  }

  dynamic "containers" {
        for_each = local.containers
        content {
            display_name          = try(containers.value.display_name, null)
            image_url             = containers.value.image_url
            environment_variables = {
              AWS_ACCESS_KEY_ID = base64decode(data.oci_secrets_secretbundle.AWS_ACCESS_KEY_ID_bundle.secret_bundle_content.0.content)
              AWS_SECRET_ACCESS_KEY = base64decode(data.oci_secrets_secretbundle.AWS_SECRET_ACCESS_KEY_bundle.secret_bundle_content.0.content)
            }

            command               = try(containers.value.command, null)
            arguments             = try(containers.value.arguments, null)

            resource_config {
                memory_limit_in_gbs = try(containers.value.memory_limit_in_gbs, null)
                vcpus_limit         = try(containers.value.vcpus_limit, null)
            }

            working_directory       = try(containers.value.working_directory, null)
        }
  }
}