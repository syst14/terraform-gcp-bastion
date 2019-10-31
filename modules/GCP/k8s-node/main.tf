#K8S Node
resource "google_compute_instance_template" "main_compute_template" {
  name_prefix = "${var.gcp_deployment_name}-k8s-node-"

  machine_type = "${var.gcp_template_machine_type}"

  region = "${var.gcp_region_name}"

  tags = [
    "k8s-node",
    "allow-ssh",
    "allow-service",
  ]

  network_interface {
    subnetwork    = "${var.gcp_private_subnet}"
    #access_config = {}
  }

  disk {
    auto_delete  = true
    boot         = true
    source_image = "${var.gcp_template_machine_image}"
    type         = "PERSISTENT"
    disk_type    = "pd-ssd"
  }

  service_account {
    email = "default"

    scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring.write",
      "https://www.googleapis.com/auth/devstorage.full_control",
    ]
  }

  metadata {
    sshKeys = "${var.gcp_ssh_user}:${file(var.gcp_ssh_pub_key_file)}"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "google_compute_instance_group_manager" "k8s-node" {
  name        = "${var.gcp_deployment_name}-k8s-node"
  description = "compute VM Instance Group"

  base_instance_name = "${var.gcp_deployment_name}-k8s-node"

  instance_template = "${google_compute_instance_template.main_compute_template.self_link}"

  zone = "${var.gcp_zone_name}"

  update_strategy = "RESTART"

  target_size  = "${var.gcp_count_of_nodes}"

  named_port {
    name = "http"
    port = "80"
  }
}

