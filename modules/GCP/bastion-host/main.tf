# Bastion Host
resource "google_compute_instance" "bastion" {
  name         = "${var.gcp_deployment_name}-bastion-host"
  machine_type = "${var.gcp_bastion_machine_type}"
  zone         = "${var.gcp_zone_name}"

  boot_disk {
    initialize_params {
      image = "${var.gcp_bastion_machine_image}"
    }
  }

  tags = ["bastion"]
  network_interface {
    subnetwork = "${var.gcp_public_subnet}"
    access_config{
      nat_ip = "${var.gcp_public_ip}"
    }
  }
  
  service_account {
    scopes = "${var.gcp_bastion_machine_scopes}"
  }

  metadata {
    sshKeys = "${var.gcp_ssh_user}:${file(var.gcp_ssh_pub_key_file)}"
  }
  can_ip_forward = "true"

  # provisioner "file" {
  #       source = "${var.gcp_ssh_key_file}"
  #       destination = "~/.ssh/id_rsa"
  #       connection {
  #           type = "ssh"
  #           user = "${var.gcp_ssh_user}"
  #           private_key = "${file("${var.gcp_ssh_key_file}")}"
  #       }
  #   }
}
