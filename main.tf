terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

data "yandex_vpc_subnet" "this" {
  name = var.subnet
}

resource "yandex_compute_instance" "this" {
    count = var.instance_count

    name        = var.name
    platform_id = var.platform_id
    zone        = var.zones[0]

    hostname = var.hostname

    resources {
        cores         = var.cores
        memory        = var.memory
        core_fraction = var.core_fraction
    }

    boot_disk {
        initialize_params {
            image_id = var.image_id
            type     = "network-ssd"
            size     = var.size
        }
    }

    network_interface {
        subnet_id          = data.yandex_vpc_subnet.this.id
        nat                = var.is_nat
        nat_ip_address     = var.nat_ip_address
        ip_address         = var.ip_address
    }

    scheduling_policy {
        preemptible = var.preemptible
    }

    metadata = {
        ssh-keys = "${var.ssh_username}:${file("${var.ssh_pubkey}")}"
    }

    allow_stopping_for_update = true

    depends_on = [
        data.yandex_vpc_subnet.this
    ]
}
