output "node_ip" {
  value = "${google_compute_instance_template.main_compute_template.network_interface.0.network_ip}"
}
output "node_tag" {
  value = "${google_compute_instance_template.main_compute_template.tags}"
}

data "google_compute_instance_group" "nodes" {
  self_link = "${google_compute_instance_group_manager.k8s-node.instance_group}"
}

#FOR MULTIPLE NODES
#There is no suuch opportunity to output all group ip. 
#After the latest version, even official workaround is unavalible. 
#Please, try to use it after next updates of terraform gcp provider.
#For now, tags working as expected and could be used for kubespray deployment


# data "google_compute_instance" "worker" {
#     self_link = "${data.google_compute_instance_group.nodes.instances}"
# }
# output "nodes_ip" {
#   value = "${data.google_compute_instance.worker.network_interface.0.network_ip}"
# }