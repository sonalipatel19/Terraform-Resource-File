module "resource_group" {
  source   = "git::https://github.com/sonalipatel19/Terraform-Module.git//modules/rg?ref=master"
  name     = var.resource_group_name
  location = var.rg_location

}

module "virtual_network" {
  source              = "git::https://github.com/sonalipatel19/Terraform-Module.git//modules/vnet?ref=master"
  name                = var.virtual_network_name
  resource_group_name = var.resource_group_name
  location            = var.rg_location
  address_space       = var.address_space

  depends_on = [module.resource_group]
}

module "subnet" {
  source               = "git::https://github.com/sonalipatel19/Terraform-Module.git//modules/subnet?ref=master"
  name                 = var.subnet_name
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.resource_group_name
  address_prefixes     = var.address_prefixes

  depends_on = [module.virtual_network]
}

module "public_ip" {
  source              = "git::https://github.com/sonalipatel19/Terraform-Module.git//modules/public-ip?ref=master"
  name                = var.pip_name
  resource_group_name = var.resource_group_name
  location            = var.rg_location
  allocation_method   = var.allocation_method

}

module "network_interface" {
  source               = "git::https://github.com/sonalipatel19/Terraform-Module.git//modules/nic?ref=master"
  name                 = var.network_interface_name
  location             = var.rg_location
  resource_group_name  = var.resource_group_name
  public_ip_address_id = module.public_ip.pip_ip_address

  ip_configuration = {
    name                          = var.ip_config_name
    subnet_id                     = module.subnet.subnet_id
    private_ip_address_allocation = var.private_ip_address_allocation
  }

}

module "network_security_group" {
  source              = "git::https://github.com/sonalipatel19/Terraform-Module.git//modules/nsg?ref=master"
  name                = var.network_security_group_name
  location            = var.rg_location
  resource_group_name = var.resource_group_name

  depends_on = [module.subnet]
}

module "network_security_rule" {
  source                      = "git::https://github.com/sonalipatel19/Terraform-Module.git//modules/security-rule?ref=master"
  name                        = var.network_security_rule_name
  priority                    = var.priority
  direction                   = var.direction
  access                      = var.access
  protocol                    = var.protocol
  source_port_range           = var.source_port_range
  destination_port_range      = var.destination_port_range
  source_address_prefix       = var.source_address_prefix
  destination_address_prefix  = var.destination_address_prefix
  resource_group_name         = var.resource_group_name
  network_security_group_name = var.network_security_group_name

  depends_on = [module.network_security_group]
}

module "subnet_network_security_group_association" {
  source                    = "git::https://github.com/sonalipatel19/Terraform-Module.git//modules/nsg-association?ref=master"
  subnet_id                 = module.subnet.subnet_id
  network_security_group_id = module.network_security_group.network_security_group_id

  depends_on = [module.network_security_group]
}



module "linux_virtual_machine" {
  source                          = "git::https://github.com/sonalipatel19/Terraform-Module.git//modules/linux-VM?ref=master"
  name                            = var.vm_name
  resource_group_name             = var.resource_group_name
  location                        = var.rg_location
  size                            = var.size
  admin_username                  = var.admin_username
  admin_password                  = var.admin_password
  disable_password_authentication = var.disable_password_authentication

  network_interface_id = module.network_interface.nic_id

  os_disk = var.os_disk

  source_image_reference = var.source_image_reference

}