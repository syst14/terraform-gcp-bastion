output "bastion_internal_ip" {
  value = "${google_compute_instance.bastion.network_interface.0.network_ip}"
}
output "bastion_tag" {
  value = "${google_compute_instance.bastion.tags}"
}