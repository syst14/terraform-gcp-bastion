output "bastion_pulic_ip" {
  value = "${google_compute_address.bastion_ip.address}"
}
