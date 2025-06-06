variable "resource_group_name" {

}

variable "rg_location" {

}

variable "virtual_network_name" {

}

variable "address_space" {

}

variable "subnet_name" {

}

variable "address_prefixes" {

}

variable "network_interface_name" {

}

variable "ip_config_name" {

}

variable "private_ip_address_allocation" {

}

variable "network_security_group_name" {

}

variable "network_security_rule_name" {

}

variable "priority" {

}

variable "direction" {

}

variable "access" {

}

variable "protocol" {

}

variable "source_port_range" {

}

variable "destination_port_range" {

}

variable "source_address_prefix" {

}

variable "destination_address_prefix" {

}

variable "pip_name" {

}

variable "allocation_method" {

}

variable "vm_name" {

}

variable "size" {

}

variable "admin_username" {

}


variable "admin_password" {

}

variable "disable_password_authentication" {

}

variable "os_disk" {
  type = object({
    caching              = string
    storage_account_type = string
  })
}

variable "source_image_reference" {
  type = object({
    publisher  = string
    offer      = string
    sku        = string
    vm_version = string
  })
}