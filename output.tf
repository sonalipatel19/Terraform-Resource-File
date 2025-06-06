output "public_ip" {
  value = module.public_ip.public_ip_address
}

output "nic_id" {
  value = module.network_interface.nic_id
}