locals {
  tags = {
    "Team"      = "Industry Cloud"
    "Project"   = "OpenLZ"
    "Terraform" = "true"
  }
  root_compartment_id = "ocid1.tenancy.oc1..aaaaaaaagt7ufsqo7ydlyrzeke6rzxllqtqlhayvhrnoi4vhtyxtq3deo7ia"

  containers = [
    {
      image_url    = "scylladb/scylla:5.4"
      display_name = "ScyllaDB base image"
      arguments = ["--listen-address=${var.private_ip}","--rpc-address=${var.private_ip}","--seed-provider-parameters seeds=${var.private_ip}","--alternator-address=${var.private_ip}","--alternator-port=8000","--alternator-write-isolation=always"]
    },
    {
      image_url    = "scylladb/scylla:5.4"
      display_name = "ScyllaDB inject user"
      command = ["/bin/bash","-c"]
      environment_variables = {
        AWS_ACCESS_KEY_ID = var.AWS_ACCESS_KEY_ID
        AWS_SECRET_ACCESS_KEY = var.AWS_SECRET_ACCESS_KEY
      }
      arguments = ["sleep 60 | echo loading cassandra keyspace | cqlsh ${var.private_ip} -u cassandra -p cassandra -e \"INSERT INTO system_auth.roles (role,can_login,is_superuser,member_of,salted_hash) VALUES ('$AWS_ACCESS_KEY_ID',True,False,null,'$AWS_SECRET_ACCESS_KEY');\""]
    },
    {
      image_url    = "amazon/aws-cli"
      display_name = "ScyllaDB create table for locks"
      command = ["/bin/sh","-c"]
      environment_variables = {
        AWS_ACCESS_KEY_ID = var.AWS_ACCESS_KEY_ID
        AWS_SECRET_ACCESS_KEY = var.AWS_SECRET_ACCESS_KEY
      }
      arguments = ["sleep 70 | aws dynamodb create-table --table-name s3-state-locks --attribute-definitions AttributeName=LockID,AttributeType=S --key-schema AttributeName=LockID,KeyType=HASH --billing-mode=PAY_PER_REQUEST --region 'None' --endpoint-url=http://${var.private_ip}:8000"]
    }
  ]
}
