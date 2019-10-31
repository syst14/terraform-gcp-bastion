# VPC
resource "google_compute_network" "gcp_project_main_network" {
  name    = "${var.gcp_main_network_name}"
  auto_create_subnetworks = "false"
}

# PRIVATE SUBNET
resource "google_compute_subnetwork" "gcp_project_private_subnet" {
  name          = "${var.gcp_private_subnet_name}"
  ip_cidr_range = "${var.gcp_private_cidr}"
  network       = "${google_compute_network.gcp_project_main_network.name}"
  region        = "${var.gcp_region_name}"
}

# PUBLIC SUBNET
resource "google_compute_subnetwork" "gcp_project_public_subnet" {
  name          =  "${var.gcp_public_subnet_name}"
  ip_cidr_range = "${var.gcp_public_cidr}"
  network       = "${google_compute_network.gcp_project_main_network.name}"
  region        = "${var.gcp_region_name}"
}

resource "google_compute_address" "bastion_ip" {
  name          = "${var.gcp_bastion_ip_name}"
  #subnetwork    = "${google_compute_subnetwork.gcp_project_public_subnet.self_link}"
  region        = "${var.gcp_region_name}"
}


# ROUTE
resource "google_compute_router" "gcp_project_router" {
  name    = "${var.gcp_router_name}"
  network = "${google_compute_network.gcp_project_main_network.name}"
  region  = "${var.gcp_region_name}"
}

# NAT GATEWAY
resource "google_compute_router_nat" "gcp_project_advanced-nat" {
  name                               = "${var.gcp_nat_name}"
  router                             = "${google_compute_router.gcp_project_router.name}"
  region                             = "${var.gcp_region_name}"
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  subnetwork {
    name = "${google_compute_subnetwork.gcp_project_private_subnet.self_link}"
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }
}