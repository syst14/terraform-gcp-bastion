variable "name_bucket" {
  type = "list"
}

variable "location_bucket" {
}

variable "project" {
}
  
variable "force_destroy" {
}

variable "storage_class" {
}

# lifecycle_rule condition block
variable "age" {
}

variable "created_before" {
}

variable "is_live" {
}

variable "matches_storage_class" {
  type = "list"
}

variable "num_newer_versions" {
}

# lifecycle_rule action block
variable "action_type" {
}

variable "action_storage_class" {
}

# versioning block
variable "versioning_enabled" {
}

# bucket ACL

variable "default_acl" {
}

variable "role_entity" {
  type = "list"
}