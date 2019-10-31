resource "google_sql_database_instance" "default" {
  region               = "${var.gcp_region_name}"
  database_version     = "${var.database_version}"

  settings {
    tier                        = "${var.tier}"
    activation_policy           = "${var.activation_policy}"
    authorized_gae_applications = ["${var.authorized_gae_applications}"]
    disk_autoresize             = "${var.disk_autoresize}"
    backup_configuration        = ["${var.backup_configuration}"]
    ip_configuration            = ["${var.ip_configuration}"]
    maintenance_window          = ["${var.maintenance_window}"]
    disk_size                   = "${var.disk_size}"
    disk_type                   = "${var.disk_type}"
    pricing_plan                = "${var.pricing_plan}"
    replication_type            = "${var.replication_type}"
  }

  replica_configuration = ["${var.replica_configuration}"]
}

resource "google_sql_database" "default" {
  count     = "${var.master_instance_name == "" ? 1 : 0}"
  name      = "${var.db_name}"
  project   = "${var.gcp_project_name}"
  instance  = "${google_sql_database_instance.default.name}"
  charset   = "${var.db_charset}"
  collation = "${var.db_collation}"
}

resource "random_id" "user-password" {
  byte_length = 8
}

resource "google_sql_user" "default" {
  count    = "${var.master_instance_name == "" ? 1 : 0}"
  name     = "${var.user_name}"
  project  = "${var.gcp_project_name}"
  instance = "${google_sql_database_instance.default.name}"
  host     = "${var.user_host}"
  password = "${var.user_password == "" ? random_id.user-password.hex : var.user_password}"
}

