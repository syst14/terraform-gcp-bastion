output "bastion_ip" {
  value = "[bastion]\n${module.network_vpc.bastion_pulic_ip}"
}
output "bastion_tag" {
  value = "${module.bastion-host.bastion_tag}"
}
output "master_ip" {
  value = "[master]\n${module.k8s-master.master_ip}"
}
output "master_tag" {
  value = "${module.k8s-master.master_tag}"
}
output "node_ip" {
  value = "[nodes]\n${module.k8s-node.node_ip}"
}
output "node_tag" {
  value = "${module.k8s-node.node_tag}"
}