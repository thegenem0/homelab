output "vm_uuid" {
  value = xenorchestra_vm.this.id
}

output "vm_ipv4s" {
  value = xenorchestra_vm.this.ipv4_addresses
}
