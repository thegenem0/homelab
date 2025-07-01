data "xenorchestra_host" "host1" {
  name_label = "xcp-ng-pc"
}

data "xenorchestra_host" "host2" {
  name_label = "xcp-ng-server"
}

data "xenorchestra_pool" "pool" {
  name_label = "xcp-ng-pool"
}
