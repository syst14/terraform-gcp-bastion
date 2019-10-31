provider "google" {
  credentials = "${file(var.gcp_credentials_file)}"
  project = "${var.gcp_project_id}"
  region  = "${var.gcp_region_name}"
  zone    = "${var.gcp_zone_name}"
}
resource "random_string" "resource" {
  length = 6
  special = false
  upper = false
}
module "network_vpc" {
  source = "../modules/GCP/network/vpc"

  gcp_region_name         = "${var.gcp_region_name}"
  gcp_zone_name           = "${var.gcp_zone_name}"
  gcp_main_network_name   = "${var.gcp_deployment_name}-${var.gcp_region_name}-main-network-${random_string.resource.result}"
  gcp_private_subnet_name = "${var.gcp_deployment_name}-${var.gcp_region_name}-private-subnet-${random_string.resource.result}"
  gcp_public_subnet_name  = "${var.gcp_deployment_name}-${var.gcp_region_name}-public-subnet-${random_string.resource.result}"
  gcp_bastion_ip_name     = "${var.gcp_deployment_name}-${var.gcp_region_name}-bastionip-${random_string.resource.result}"
  gcp_router_name         = "${var.gcp_router_name}-${random_string.resource.result}"
  gcp_nat_name            = "${var.gcp_nat_name}-${random_string.resource.result}"
  gcp_public_cidr         = "${var.gcp_public_cidr}"
  gcp_private_cidr        = "${var.gcp_private_cidr}"
}

module "bastion-host" {
  source = "../modules/GCP/bastion-host"

  gcp_deployment_name             = "${var.gcp_deployment_name}-${random_string.resource.result}"
  gcp_region_name                 = "${var.gcp_region_name}"
  gcp_zone_name                   = "${var.gcp_zone_name}"
  gcp_bastion_machine_type        = "${var.gcp_bastion_machine_type}"
  gcp_bastion_machine_image       = "${var.gcp_bastion_machine_image}"
  gcp_bastion_machine_scopes      = "${var.gcp_bastion_machine_scopes}"
  gcp_public_subnet               = "${module.network_vpc.public_subnet}"
  gcp_public_ip                   = "${module.network_vpc.bastion_ip}"
  gcp_ssh_user                    = "${var.gcp_ssh_user}"
  gcp_ssh_pub_key_file            = "${var.gcp_ssh_pub_key_file}"
  #gcp_can_ip_forward              = "${var.gcp_can_ip_forward}"
  #gcp_ssh_key_file                = "${var.gcp_ssh_key_file}"
}

module "k8s-master" {
  source = "../modules/GCP/k8s-master"

  gcp_deployment_name         = "${var.gcp_deployment_name}-${random_string.resource.result}"
  gcp_region_name             = "${var.gcp_region_name}"
  gcp_zone_name               = "${var.gcp_zone_name}"
  gcp_k8s_host_machine_type   = "${var.gcp_k8s_host_machine_type}"
  gcp_k8s_host_machine_image  = "${var.gcp_k8s_host_machine_image}"
  gcp_k8s_host_machine_scopes = "${var.gcp_k8s_host_machine_scopes}"
  gcp_private_subnet          = "${module.network_vpc.private_subnet}"
  gcp_ssh_user                = "${var.gcp_ssh_user}"
  gcp_ssh_pub_key_file        = "${var.gcp_ssh_pub_key_file}"
}

module "k8s-node" {
  source = "../modules/GCP/k8s-node"

  gcp_deployment_name          = "${var.gcp_deployment_name}-${random_string.resource.result}"
  gcp_region_name              = "${var.gcp_region_name}"
  gcp_zone_name                = "${var.gcp_zone_name}"
  gcp_template_machine_type    = "${var.gcp_template_machine_type}"
  gcp_template_machine_image   = "${var.gcp_template_machine_image}"
  gcp_private_subnet           = "${module.network_vpc.private_subnet}"
  #gcp_scopes_node_host_machine = "${var.gcp_scopes_node_host_machine}"
  gcp_ssh_user                 = "${var.gcp_ssh_user}"
  gcp_ssh_pub_key_file         = "${var.gcp_ssh_pub_key_file}"
  gcp_count_of_nodes           = "${var.gcp_count_of_nodes}"
}

module "firewall" {
  source = "../modules/GCP/firewall"

  gcp_deployment_name = "${var.gcp_deployment_name}-${random_string.resource.result}"
  gcp_main_network    = "${module.network_vpc.main_network}"
}

# WILL BE SEPARATED

# module "storage" {
#   source = "../modules/GCP/storage"

#   name_bucket           = "${var.name_bucket}"
#   location_bucket       = "${var.location_bucket}"
#   project               = "${var.gcp_project_id}"
#   force_destroy         = "${var.force_destroy}"
#   storage_class         = "${var.storage_class}"
#   age                   = "${var.age}"
#   created_before        = "${var.created_before}"
#   is_live               = "${var.is_live}"
#   matches_storage_class = "${var.matches_storage_class}"
#   num_newer_versions    = "${var.num_newer_versions}"
#   action_type           = "${var.action_type}"
#   action_storage_class  = "${var.action_storage_class}"
#   versioning_enabled    = "${var.versioning_enabled}"
#   default_acl           = "${var.default_acl}"
#   role_entity           = "${var.role_entity}"
# }

#NOT IN USE

# module "nosql" {
#   source = "../modules/GCP/nosql"
# 
#   gcp_name_nosql_instance   = "${var.gcp_name_nosql_instance}"
#   gcp_cluster_id            = "${var.gcp_cluster_id}"
#   gcp_zone_name             = "${var.gcp_zone_name}"
#   gcp_num_nodes             = "${var.gcp_num_nodes}"
#   gcp_nosql_storage_type    = "${var.gcp_nosql_storage_type}"
#   gcp_name_table            = "${var.gcp_name_table}"
#   bigtable_table_split_keys = "${var.bigtable_table_split_keys}"
# }


# module "pub_sub" {
#   source = "../modules/GCP/pub_sub"
# 
#   name_topic           = "${var.name_topic}"
#   ack_deadline_seconds = "${var.ack_deadline_seconds}"
#   name_subscription    = "${var.name_subscription}"
# }
# 
# module "sql" {
#   source = "../modules/GCP/sql"
# 
#   gcp_project_name            = "${var.gcp_project_name }"
#   gcp_region_name             = "${var.gcp_region_name}"
#   database_version            = "${var.database_version}"
#   master_instance_name        = "${var.master_instance_name}"
#   tier                        = "${var.tier}"
#   db_name                     = "${var.db_name}"
#   db_charset                  = "${var.db_charset}"
#   db_collation                = "${var.db_collation}"
#   user_name                   = "${var.user_name}"
#   user_host                   = "${var.user_host}"
#   user_password               = "${var.user_password}"
#   activation_policy           = "${var.activation_policy}"
#   authorized_gae_applications = "${var.authorized_gae_applications}"
#   disk_autoresize             = "${var.disk_autoresize}"
#   disk_size                   = "${var.disk_size}"
#   disk_type                   = "${var.disk_type}"
#   pricing_plan                = "${var.pricing_plan}"
#   replication_type            = "${var.replication_type}"
#   backup_configuration        = "${var.backup_configuration}"
#   ip_configuration            = "${var.ip_configuration}"
#   maintenance_window          = "${var.maintenance_window}"
#   replica_configuration       = "${var.replica_configuration}"
# }

