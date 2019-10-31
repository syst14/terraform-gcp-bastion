
variable "gcp_region_name" {}

variable "gcp_zone_name" {}

variable "gcp_deployment_name" {}

variable "gcp_bastion_machine_type" {}

variable "gcp_bastion_machine_image" {}

variable "gcp_bastion_machine_scopes" {
    type = "list"
}
variable "gcp_public_subnet" {}

variable "gcp_public_ip" {}
variable "gcp_ssh_user" {}

variable "gcp_ssh_pub_key_file" {}
