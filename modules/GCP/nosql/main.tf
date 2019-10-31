resource "google_bigtable_instance" "instance" {
  name         = "${var.gcp_name_nosql_instance}"
  cluster_id   = "${var.gcp_cluster_id}"
  zone         = "${var.gcp_zone_name}"
  num_nodes    = "${var.gcp_num_nodes}"
  storage_type = "${var.gcp_nosql_storage_type}"
}

resource "google_bigtable_table" "table" {
  name          = "${var.gcp_name_table}"
  instance_name = "${google_bigtable_instance.instance.name}"
  split_keys    = "${var.bigtable_table_split_keys}"
}