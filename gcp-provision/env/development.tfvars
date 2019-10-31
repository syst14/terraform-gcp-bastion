#Main meta params
gcp_credentials_file = "../../keys/account.json"

gcp_deployment_name = "test14"

gcp_region_name = "us-west2"

gcp_zone_name = "us-west2-a"

gcp_project_id = "avitiuk-devops"

#Network params

gcp_nat_name = "test-nat"

gcp_router_name = "test-router"

gcp_public_cidr = "10.8.0.0/16"

gcp_private_cidr = "10.0.0.0/16"

#Bastion machine settings

gcp_bastion_machine_type = "n1-standard-1"

gcp_bastion_machine_image = "centos-cloud/centos-7"

gcp_bastion_machine_scopes = ["userinfo-email", "compute-ro", "storage-ro"]

#gcp_can_ip_forward = "true"

#K8s host machine settings

gcp_k8s_host_machine_type = "n1-standard-2"

gcp_k8s_host_machine_image = "centos-cloud/centos-7"

gcp_k8s_host_machine_scopes = ["userinfo-email", "compute-ro", "storage-ro"]

#K8s node machine settings

gcp_template_machine_type = "n1-standard-1"

gcp_template_machine_image = "centos-cloud/centos-7"

gcp_scopes_node_host_machine = ["userinfo-email", "compute-ro", "storage-ro"]

gcp_count_of_nodes = "2"

#SSH access

gcp_ssh_user = "main"

#gcp_ssh_pub_key_file = "id_rsa.pub"
gcp_ssh_pub_key_file = "~/.ssh/id_rsa.pub"

gcp_ssh_key_file = "id_rsa"

#Storage settings

#bigtable_table_split_keys = ["a", "b", "c"]

# default_acl = "private"

# db_charset = "UTF8"

# db_collation = "en_US.UTF8"

# gcp_num_nodes = "0"

# authorized_gae_applications = []

# backup_configuration = {}

# ip_configuration = [{}]

# maintenance_window = []

# replica_configuration = []

# gcp_name_nosql_instance = "hddsql4test"

# gcp_cluster_id = "hddsql-id4test"

# gcp_nosql_storage_type = "HDD"

# gcp_name_table = "table_test"

# name_topic = "nametopic4test"

# ack_deadline_seconds = "30"

# name_subscription = "sub4test"

# database_version = "POSTGRES_9_6"

# master_instance_name = "cvf54546h56hj"

# tier = "db-f1-micro"

# db_name = "default"

# user_name = "user"

# user_host = "%"

# user_password = "4r3!ff3g@#"

# activation_policy = "ALWAYS"

# authorized_gae_application = []

# disk_autoresize = "true"

# disk_size = "10"

# disk_type = "PD_SSD"

# pricing_plan = "PER_USE"

# replication_type = "SYNCHRONOUS"

# name_bucket = ["dop47s"]

# location_bucket = "us-west1"

# owner_mail_bucket = "user-my.email@gmail.com"

# read_group_bucket = "group-mygroup"

# name = ["some_buc"]

# location = ""

# project = ""

# force_destroy = "true"

# storage_class = "REGIONAL"

# age = "60"

# created_before = "2017-06-13"

# is_live = "false"

# matches_storage_class = ["REGIONAL"]

# num_newer_versions = "10"

# action_type = "SetStorageClass"

# action_storage_class = "NEARLINE"

# versioning_enabled = "true"

# role_entity = []