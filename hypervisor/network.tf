data "xenorchestra_pif" "eth0" {
  device  = "eth0"
  vlan    = -1
  host_id = data.xenorchestra_host.host1.id
}

data "xenorchestra_pif" "eth1" {
  device  = "eth1"
  vlan    = -1
  host_id = data.xenorchestra_host.host1.id
}

resource "xenorchestra_bonded_network" "network" {
  name_label = "bond0"
  name_description = "Pool bonded network"
  bond_mode  = "active-backup"
  pool_id    = data.xenorchestra_host.host1.pool_id
  pif_ids = [
    data.xenorchestra_pif.eth1.id,
    data.xenorchestra_pif.eth0.id
  ]
}
