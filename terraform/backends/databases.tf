# resource postgresql_database "core" {
#   name = "core"
# }

resource "postgresql_database" "mgmt_db" {
  name = "mgmt"
}

resource "postgresql_role" "mgmt_role" {
  name     = "mgmt"
  login    = true
  password = "mypass"
}

# Grant priviliges on the database
resource "postgresql_grant" "mgmt_grant" {
  database    = postgresql_database.mgmt_db.name
  role        = postgresql_role.mgmt_role.name
  object_type = "database"
  privileges  = ["ALL"]
}