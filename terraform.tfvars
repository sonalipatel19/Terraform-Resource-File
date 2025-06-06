resource_group_name = "demo-rg1"
rg_location         = "east us"

virtual_network_name = "demo-vnet"
address_space        = "10.0.0.0/16"

subnet_name      = "demo-subnet"
address_prefixes = "10.0.1.0/24"

network_interface_name        = "demo-nic"
ip_config_name                = "ipconfig1"
private_ip_address_allocation = "Dynamic"

network_security_group_name = "demo-nsg"

network_security_rule_name = "rule1"
priority                   = "100"
direction                  = "Inbound"
access                     = "Allow"
protocol                   = "Tcp"
source_port_range          = "*"
destination_port_range     = "*"
source_address_prefix      = "*"
destination_address_prefix = "*"

pip_name          = "pip1"
allocation_method = "Static"


vm_name                         = "vm1"
size                            = "Standard_B1s"
admin_username                  = "azureadmin"
admin_password                  = "Test@12345678"
disable_password_authentication = false

os_disk = {
  caching              = "ReadWrite"
  storage_account_type = "Standard_LRS"
}

source_image_reference = {
  publisher  = "Canonical"
  offer      = "0001-com-ubuntu-server-jammy"
  sku        = "22_04-lts"
  vm_version = "latest"
}