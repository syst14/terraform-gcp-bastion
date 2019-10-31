# K8S Master
resource "google_compute_instance" "K8S_Master" {
  name         = "${var.gcp_deployment_name}-k8s-master"
  machine_type = "${var.gcp_k8s_host_machine_type}"
  zone = "${var.gcp_zone_name}"

  tags = ["k8s-master"]
  boot_disk {
    initialize_params {
      image = "${var.gcp_k8s_host_machine_image}"
    }
  }

  network_interface {
    subnetwork = "${var.gcp_private_subnet}"

    #access_config {
    #  // Ephemeral IP
    #}
  }

  # provisioner "file" {
  #     source = "id_rsa.pub"
  #     destination = "~/.ssh/id_rsa.pub"
  #     connection {
  #         type = "ssh"
  #         user = "${var.gcp_ssh_user}"
  #         private_key = "${file("id_rsa")}"
  #     }
  # }

  metadata {
    sshKeys = "${var.gcp_ssh_user}:${file(var.gcp_ssh_pub_key_file)}"
  }

  service_account {
    scopes = "${var.gcp_k8s_host_machine_scopes}"
  }
}