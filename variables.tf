variable "create" {
    type    = bool
    default = true
}
variable "name" {
    type = string
}
variable "engine" {
    type    = string
}
variable "engine_version" {
    type    = string
}
variable "node_type" {
    type    = string
}
variable "parameter_group_name" {
    type    = string
}
variable "maintenance_window" {
    type    = string
    default = ""
}
variable "port" {
    type    = number
}
variable "num_cache_nodes" {
    type    = number
}
variable "security_group_ids" {
    type    = list
    default = []
}
variable "az_mode" {
    type = string
    default = ""
}
variable "cache_subnet_group" {
    type = any
    default = []
}
variable "default_tags" {
    type    = map(string)
    default = {}
} 
variable "security_group_names" {
    type = list
    default = []
}
