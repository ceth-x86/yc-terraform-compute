# yc-terraform-compute

Terraform module to create Yandex Cloud Compute:

Example:

```
terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

provider "yandex" {
    folder_id = "folder_id"
    zone = "ru-central1-a"
    token = "token"
}

module "compute" {
    source = "github.com/demas/yc-terraform-compute"

    image_id = "fd8veme9fg6pbg5ost48"  # Ubuntu 18.04 LTS
    is_nat = true
    subnet = "subnet_name"
    folder_id = "folder_id"

    name = "dev"
    hostname = "dev"

    cores = 2
    memory = 4
    size = "10"

    ssh_username = "ubuntu"
    ssh_pubkey = "~/.ssh/id_rsa.pub"

    preemptible = true
}
```
