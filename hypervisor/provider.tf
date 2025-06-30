terraform {
  required_providers {
    xenorchestra = {
      source  = "vatesfr/xenorchestra"
      version = "0.32.0"
    }
  }
}

# I don't intend to make this accessible externally,
# so just a basic local ip is fine
provider "xenorchestra" {
  url      = "ws://192.168.1.50"
  username = var.orchestra_user
  password = var.orchestra_password
  insecure = true
}
