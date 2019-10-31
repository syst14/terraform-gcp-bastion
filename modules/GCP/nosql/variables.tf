
variable "gcp_name_nosql_instance" {}

variable "gcp_cluster_id" {}

variable "gcp_zone_name" {}

variable "gcp_num_nodes" {}

variable "gcp_nosql_storage_type" {}

variable "gcp_name_table" {}

variable "bigtable_table_split_keys" {
    type = "list"
}

