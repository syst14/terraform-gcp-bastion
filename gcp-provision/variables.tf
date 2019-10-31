variable "gcp_credentials_file" {
  default = "account.json"
}

#add CIDR
#add defauls as in module
#no default

variable "gcp_deployment_name" {
  #default = "test"
}
variable "gcp_region_name" {
  #default = "us-west2"
}

variable "gcp_zone_name" {
  #default = "${var.gcp_region_name}-a"
}

variable "gcp_project_id" {
  #default = "exadel-devops"
}

variable "gcp_nat_name" {
  default = "k8s-nat"
}

variable "gcp_router_name" {
  default = "k8s-router"
}

# lifecycle_rule condition block

variable "gcp_bastion_machine_type" {
  #default = "n1-standard-1"
}

variable "gcp_bastion_machine_image" {
  #default = "debian-cloud/debian-9"
}

variable "gcp_bastion_machine_scopes" {
  type    = "list"
  default = ["userinfo-email", "compute-ro", "storage-ro"]
}

# variable "gcp_can_ip_forward" {
#   #default = "true"
# }

variable "gcp_k8s_host_machine_type" {
  #default = "n1-standard-1"
}

variable "gcp_k8s_host_machine_image" {
  #default = "debian-cloud/debian-9"
}

variable "gcp_k8s_host_machine_scopes" {
  type    = "list"
  default = ["userinfo-email", "compute-ro", "storage-ro"]
}

variable "gcp_template_machine_type" {
  #default = "n1-standard-1"
}

variable "gcp_template_machine_image" {
  #default = "debian-cloud/debian-9"
}

variable "gcp_scopes_node_host_machine" {
  type    = "list"
  default = ["userinfo-email", "compute-ro", "storage-ro"]
}

variable "gcp_ssh_user" {
  #default = "main"
}

variable "gcp_ssh_pub_key_file" {
  #default = "123"
}

# variable "gcp_ssh_key_file" {
#   #default = "123"
# }

variable "gcp_count_of_nodes" {
  #default = "1"
}

variable "gcp_public_cidr" {
  #default = "10.8.0.0/16"
}

variable "gcp_private_cidr" {
  #default = "10.0.0.0/16"
}


#NOT IN USE NOW
# variable "gcp_num_nodes" {
#   #default = "3"
# }

# variable "gcp_name_nosql_instance" {
#   #default = "hddsql4test"
# }

# variable "gcp_cluster_id" {
#   #default = "hddsql-id4test"
# }

# variable "gcp_nosql_storage_type" {
#   #default = "HDD"
# }

# variable "gcp_name_table" {
#   #default = "table_test"
# }

# variable "name_topic" {
#   #default = "nametopic4test"
# }

# variable "ack_deadline_seconds" {
#   #default = "30"
# }

# variable "name_subscription" {
#   #default = "#default-sub4test"
# }

# variable database_version {
#   description = "The version of of the database. For example, `MYSQL_5_6` or `POSTGRES_9_6`."
#   #default     = "POSTGRES_9_6"
# }

# variable master_instance_name {
#   description = "The name of the master instance to replicate"
#   #default     = "cvf54546h56hj"
# }

# variable tier {
#   description = "The machine tier (First Generation) or type (Second Generation). See this page for supported tiers and pricing: https://cloud.google.com/sql/pricing"
#   #default     = "db-f1-micro"
# }

# variable db_name {
#   description = "Name of the #default database to create"
#   #default     = "#default"
# }

# variable db_charset {
#   description = "The charset for the #default database"
#   #default     = ""
# }

# variable db_collation {
#   description = "The collation for the #default database. Example for MySQL databases: 'utf8_general_ci', and Postgres: 'en_US.UTF8'"
#   #default     = ""
# }

# variable user_name {
#   description = "The name of the #default user"
#   #default     = "#default"
# }

# variable user_host {
#   description = "The host for the #default user"
#   #default     = "%"
# }

# variable user_password {
#   description = "The password for the #default user. If not set, a random one will be generated and available in the generated_user_password output variable."
#   #default     = ""
# }

# variable activation_policy {
#   description = "This specifies when the instance should be active. Can be either `ALWAYS`, `NEVER` or `ON_DEMAND`."
#   #default     = "ALWAYS"
# }

# variable authorized_gae_applications {
#   description = "A list of Google App Engine (GAE) project names that are allowed to access this instance."
#   type        = "list"
#   #default     = []
# }

# variable "bigtable_table_split_keys" {
#   type    = "list"
#   #default = ["a", "b", "c"]
# }
# variable disk_autoresize {
#   description = "Second Generation only. Configuration to increase storage size automatically."
#   #default     = true
# }

# variable disk_size {
#   description = "Second generation only. The size of data disk, in GB. Size of a running instance cannot be reduced but can be increased."
#   #default     = 10
# }

# variable disk_type {
#   description = "Second generation only. The type of data disk: `PD_SSD` or `PD_HDD`."
#   #default     = "PD_SSD"
# }

# variable pricing_plan {
#   description = "First generation only. Pricing plan for this instance, can be one of `PER_USE` or `PACKAGE`."
#   #default     = "PER_USE"
# }

# variable replication_type {
#   description = "Replication type for this instance, can be one of `ASYNCHRONOUS` or `SYNCHRONOUS`."
#   #default     = "SYNCHRONOUS"
# }

# variable backup_configuration {
#   description = "The backup_configuration settings subblock for the database setings"
#   type        = "map"
#   #default     = {}
# }

# variable ip_configuration {
#   description = "The ip_configuration settings subblock"
#   type        = "list"
#   #default     = [{}]
# }

# variable maintenance_window {
#   description = "The maintenance_window settings subblock"
#   type        = "list"
#   #default     = []
# }

# variable replica_configuration {
#   description = "The optional replica_configuration block for the database instance"
#   type        = "list"
#   #default     = []
# }

# variable "name_bucket" {
#   type    = "list"
#   #default = ["dopr2r3f345s"]
# }

# variable "location_bucket" {
#   #default = "us-west1"
# }

# variable "owner_mail_bucket" {
#   #default = "user-my.email@gmail.com"
# }

# variable "read_group_bucket" {
#   #default = "group-mygroup"
# }

# variable "name" {
#   type        = "list"
#   #default     = ["some_bucsdgd34gf34g3fssg353gsket"]
#   description = "The name of the bucket."
# }

# variable "location" {
#   description = "The GCS location."
#   #default     = ""
# }

# variable "project" {
#   description = "The project in which the resource belongs. If it is not provided, the provider project is used."
#   #default     = ""
# }

# variable "force_destroy" {
#   description = "When deleting a bucket, this boolean option will delete all contained objects."
#   #default     = "false"
# }

# variable "storage_class" {
#   description = "The Storage Class of the new bucket. Supported values include: MULTI_REGIONAL, (NS) REGIONAL, NEARLINE, (NS) COLDLINE."
#   #default     = "REGIONAL"
# }
# variable "is_live" {
#   description = "Relevant only for versioned objects. If true, this condition matches live objects, archived objects otherwise."
#   #default     = "false"
# }

# variable "matches_storage_class" {
#   description = "Storage Class of objects to satisfy this condition. Supported values include: MULTI_REGIONAL, REGIONAL, NEARLINE, COLDLINE, STANDARD, DURABLE_REDUCED_AVAILABILITY."
#   type        = "list"
#   #default     = ["REGIONAL"]
# }

# variable "num_newer_versions" {
#   description = "Relevant only for versioned objects. The number of newer versions of an object to satisfy this condition."
#   #default     = "10"
# }

# # lifecycle_rule action block
# variable "action_type" {
#   description = "The type of the action of this Lifecycle Rule. Supported values include: Delete and SetStorageClass."
#   #default     = "SetStorageClass"
# }

# variable "action_storage_class" {
#   description = "The target Storage Class of objects affected by this Lifecycle Rule. Supported values include: MULTI_REGIONAL, REGIONAL, NEARLINE, COLDLINE."
#   #default     = "NEARLINE"
# }

# # versioning block
# variable "versioning_enabled" {
#   description = "While set to true, versioning is fully enabled for this bucket."
#   #default     = "true"
# }

# # bucket ACL

# variable "default_acl" {
#   description = "Configure this ACL to be the #default ACL."
#   #default     = "private"
# }

# variable "role_entity" {
#   description = "List of role/entity pairs in the form ROLE:entity."
#   type        = "list"
#   #default     = []
# }
# variable "age" {
#   description = "Minimum age of an object in days to satisfy this condition."
#   #default     = "60"
# }

# variable "created_before" {
#   description = "Creation date of an object in RFC 3339 (e.g. 2017-06-13) to satisfy this condition."
#   #default     = "2017-06-13"
# }