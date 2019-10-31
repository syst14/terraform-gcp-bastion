

variable "gcp_region_name" {}

variable "gcp_zone_name" {}

variable "gcp_deployment_name" {}

variable "gcp_k8s_host_machine_type" {}

variable "gcp_k8s_host_machine_image" {}

variable "gcp_k8s_host_machine_scopes" {
    type = "list"
}
variable "gcp_private_subnet" {}

variable "gcp_ssh_user" {}

variable "gcp_ssh_pub_key_file" { }

