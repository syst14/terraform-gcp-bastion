# SSH
resource "google_compute_firewall" "ssh" {
  name    = "${var.gcp_deployment_name}-allow-ssh"
  network = "${var.gcp_main_network}"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  priority = "65534"
}

# ICMP
resource "google_compute_firewall" "icmp" {
  name    = "${var.gcp_deployment_name}-allow-icmp"
  network = "${var.gcp_main_network}"

  allow {
    protocol = "icmp"
  }

  priority = "65534"
}

# INTERANL
resource "google_compute_firewall" "internal" {
  name    = "${var.gcp_deployment_name}-allow-internal"
  network = "${var.gcp_main_network}"

  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }

  allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }

  allow {
    protocol = "icmp"
  }

  priority = "65534"
}

