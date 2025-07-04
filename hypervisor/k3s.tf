module "master-01" {
  source = "./ubnt-vm/"

  subsystem = "k3s"
  name      = "master-01"

  cpu = 2
  mem = 2

  affinity_host = data.xenorchestra_host.host1.id
  network_id    = xenorchestra_bonded_network.network.id

  network = {
    ipv4_address    = "192.168.1.60"
    ipv4_prefix     = "24"
    default_gateway = local.default_gateway
  }

  disks = [
    {
      sr_uuid   = data.xenorchestra_sr.pc_ssd.id,
      disk_name = "k3s-master-01-boot",
      disk_size = 40,
    }
  ]
}

module "master-02" {
  source = "./ubnt-vm/"

  subsystem = "k3s"
  name      = "master-02"

  cpu = 2
  mem = 2

  affinity_host = data.xenorchestra_host.host2.id
  network_id    = xenorchestra_bonded_network.network.id

  network = {
    ipv4_address    = "192.168.1.61"
    ipv4_prefix     = "24"
    default_gateway = local.default_gateway
  }

  disks = [
    {
      sr_uuid   = data.xenorchestra_sr.server_ssd.id,
      disk_name = "k3s-master-02-boot",
      disk_size = 40,
    }
  ]
}

module "agent-01" {
  source = "./ubnt-vm/"

  subsystem = "k3s"
  name      = "agent-01"

  cpu = 1
  mem = 2

  affinity_host = data.xenorchestra_host.host2.id
  network_id    = xenorchestra_bonded_network.network.id

  network = {
    ipv4_address    = "192.168.1.65"
    ipv4_prefix     = "24"
    default_gateway = local.default_gateway
  }

  disks = [
    {
      sr_uuid   = data.xenorchestra_sr.server_sas.id,
      disk_name = "k3s-agent-01-boot",
      disk_size = 20,
    }
  ]
}


module "agent-02" {
  source = "./ubnt-vm/"

  subsystem = "k3s"
  name      = "agent-02"

  cpu = 1
  mem = 2

  affinity_host = data.xenorchestra_host.host2.id
  network_id    = xenorchestra_bonded_network.network.id

  network = {
    ipv4_address    = "192.168.1.66"
    ipv4_prefix     = "24"
    default_gateway = local.default_gateway
  }

  disks = [
    {
      sr_uuid   = data.xenorchestra_sr.server_sas.id,
      disk_name = "k3s-agent-02-boot",
      disk_size = 20,
    }
  ]
}

module "agent-03" {
  source = "./ubnt-vm/"

  subsystem = "k3s"
  name      = "agent-03"

  cpu = 1
  mem = 2

  affinity_host = data.xenorchestra_host.host2.id
  network_id    = xenorchestra_bonded_network.network.id

  network = {
    ipv4_address    = "192.168.1.67"
    ipv4_prefix     = "24"
    default_gateway = local.default_gateway
  }

  disks = [
    {
      sr_uuid   = data.xenorchestra_sr.server_sas.id,
      disk_name = "k3s-agent-03-boot",
      disk_size = 20,
    }
  ]
}

module "agent-04" {
  source = "./ubnt-vm/"

  subsystem = "k3s"
  name      = "agent-04"

  cpu = 1
  mem = 2

  affinity_host = data.xenorchestra_host.host2.id
  network_id    = xenorchestra_bonded_network.network.id

  network = {
    ipv4_address    = "192.168.1.68"
    ipv4_prefix     = "24"
    default_gateway = local.default_gateway
  }

  disks = [
    {
      sr_uuid   = data.xenorchestra_sr.server_sas.id,
      disk_name = "k3s-agent-04-boot",
      disk_size = 20,
    }
  ]
}

output "k3s_master_01_uuid" {
  value = module.master-01.vm_uuid
}

output "k3s_master_01_ipv4s" {
  value = module.master-01.vm_ipv4s
}

output "k3s_master_02_uuid" {
  value = module.master-02.vm_uuid
}

output "k3s_master_02_ipv4s" {
  value = module.master-02.vm_ipv4s
}

output "k3s_agent_01_uuid" {
  value = module.agent-01.vm_uuid
}

output "k3s_agent_01_ipv4s" {
  value = module.agent-01.vm_ipv4s
}

output "k3s_agent_02_uuid" {
  value = module.agent-02.vm_uuid
}

output "k3s_agent_02_ipv4s" {
  value = module.agent-02.vm_ipv4s
}

output "k3s_agent_03_uuid" {
  value = module.agent-03.vm_uuid
}

output "k3s_agent_03_ipv4s" {
  value = module.agent-03.vm_ipv4s
}

output "k3s_agent_04_uuid" {
  value = module.agent-04.vm_uuid
}

output "k3s_agent_04_ipv4s" {
  value = module.agent-04.vm_ipv4s
}
