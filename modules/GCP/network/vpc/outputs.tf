output "main_network" {
  value = "${google_compute_network.gcp_project_main_network.name}"
}
output "public_subnet" {
  value = "${google_compute_subnetwork.gcp_project_public_subnet.name}"
}
output "private_subnet" {
  value = "${google_compute_subnetwork.gcp_project_private_subnet.name}"
}
output "bastion_ip" {
  value = "${google_compute_address.bastion_ip.address}"
}
