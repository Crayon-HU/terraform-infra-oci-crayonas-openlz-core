# resource postgresql_database "core" {
#   name = "core"
# }

resource postgresql_database "mgmt" {
  name = "mgmt"
}

resource "postgresql_role" "mgmt" {
  name     = "mgmt"
  login    = true
  password = "mypass"
}