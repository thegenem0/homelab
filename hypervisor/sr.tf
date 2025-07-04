data "xenorchestra_sr" "pc_hdd" {
  name_label = "PC HDD Storage"
}

data "xenorchestra_sr" "pc_ssd" {
  name_label = "PC SSD Storage"
}

data "xenorchestra_sr" "server_sas" {
  name_label = "Server SAS Storage"
}

data "xenorchestra_sr" "server_hdd" {
  name_label = "Server HDD Storage"
}

data "xenorchestra_sr" "server_ssd" {
  name_label = "Server SSD Storage"
}
