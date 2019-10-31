output "master_ip" {
  value = "${google_compute_instance.K8S_Master.network_interface.0.network_ip}"
}
output "master_tag" {
  value = "${google_compute_instance.K8S_Master.tags}"
}