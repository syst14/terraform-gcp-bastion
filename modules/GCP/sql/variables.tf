variable gcp_project_name {}

variable gcp_region_name {}

variable database_version {}

variable master_instance_name {}

variable tier {}

variable db_name {}

variable db_charset {}

variable db_collation {}

variable user_name {}

variable user_host {}

variable user_password {}

variable activation_policy {}

variable authorized_gae_applications {
  type = "list"
}

variable disk_autoresize {}

variable disk_size {}

variable disk_type {}

variable pricing_plan {}

variable replication_type {}

variable backup_configuration {
  type = "map"
}

variable ip_configuration {
  type = "list"
}


variable maintenance_window {
  type = "list"
}

variable replica_configuration {
  type = "list"
}