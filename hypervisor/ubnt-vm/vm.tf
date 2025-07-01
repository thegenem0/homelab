locals {
  ip_parts      = split(".", var.network.ipv4_address)
  expected_ip   = join(".", [local.ip_parts[0], local.ip_parts[1], local.ip_parts[2]])
  expected_cidr = "${local.expected_ip}.0/${var.network.ipv4_prefix}"
}


data "xenorchestra_template" "this" {
  name_label = "Ubuntu 24.04 Cloud-Init (Hub)"
}

resource "xenorchestra_vm" "this" {
  memory_max   = tostring(var.mem * 1024 * 1024 * 1024)
  cpus         = tostring(var.cpu)
  auto_poweron = true

  cloud_config = templatefile("${path.module}/cloud_config.tftpl", {
    name      = var.name
    subsystem = var.subsystem
  })

  cloud_network_config = templatefile("${path.module}/cloud_network_config.tftpl", {
    ipv4        = var.network.ipv4_address
    ipv4_prefix = var.network.ipv4_prefix
    ipv4_gw     = var.network.default_gateway
    dns01       = var.network.default_gateway
    dns02       = "1.1.1.1"
  })

  name_label       = "${var.subsystem}-${var.name}"
  name_description = "managed by terraform"
  template         = data.xenorchestra_template.this.id

  affinity_host = var.affinity_host

  network {
    network_id       = var.network_id
    expected_ip_cidr = local.expected_cidr
  }

  dynamic "disk" {
    for_each = var.disks

    content {
      sr_id      = disk.value.sr_uuid
      name_label = disk.value.disk_name
      size       = tostring(disk.value.disk_size * 1024 * 1024 * 1024)
    }
  }

  timeouts {
    create = "20m"
  }
}
