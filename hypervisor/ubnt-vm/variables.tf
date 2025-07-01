variable "mem" {
  type        = number
  description = "Host memory in GB"
}

variable "cpu" {
  type        = number
  description = "Host CPU count"
}

variable "subsystem" {
  type        = string
  description = "Subsystem this VM belongs to"
}

variable "name" {
  type        = string
  description = "Name of this VM"
}

variable "affinity_host" {
  type        = string
  description = "ID of host which this VM should be deployed on"
}

variable "network_id" {
  type        = string
  description = "Network this VM should connect to"
}

variable "network" {
  type = object({
    ipv4_address    = string
    ipv4_prefix     = string
    default_gateway = string
  })
}

variable "disks" {
  type = list(object({
    sr_uuid   = string
    disk_name = string
    disk_size = number
  }))

  description = "Disks assigned to this VM"
}
