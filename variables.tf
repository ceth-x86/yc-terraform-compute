variable "instance_count" {
    type        = number
    description = "Instance count"
    default     = 1
}

variable "platform_id" {
    type        = string
    description = "The type of virtual machine to create"
    default     = "standard-v2"
}
variable "folder_id" {
    type        = string
    description = "Folder ID"
}

variable "image_id" {
    type        = string
    description = "Image ID"
}

variable "zones" {
    type        = list(string)
    description = "Yandex Cloud Zones for provisoned resources"
    default     = ["ru-central1-a", "ru-central1-b", "ru-central1-c"]
}

variable "name" {
    type        = string
    description = "Yandex Cloud Compute instance name"
}

variable "hostname" {
    type        = string
    description = "Host name for the instance. This field is used to generate the instance fqdn value"
}

variable "preemptible" {
    type        = bool
    description = "Specifies if the instance is preemptible"
    default     = false
}

variable "is_nat" {
    type        = bool
    description = "Provide a public address for instance to access the internet over NAT"
    default     = false
}

variable "size" {
    type        = string
    description = "Size of the boot disk in GB"
    default     = "10"
}

variable "cores" {
    type        = number
    description = "CPU cores for the instance"
    default     = 2
}

variable "memory" {
    type        = number
    description = "Memory size for the instance in GB"
    default     = 2
}

variable "core_fraction" {
    type        = number
    description = "Baseline performance for a core as a percent"
    default     = 100
}

variable "subnet" {
    type        = string
    description = "Yandex VPC subnet"
}

# IP address should be already reserved in web UI
variable "nat_ip_address" {
    type        = string
    description = "Public IP address for instance to access the internet over NAT"
    default     = ""
}

variable "ip_address" {
    type        = string
    description = "The private IP address to assign to the instance. If empty, the address will be automatically assigned from the specified subnet"
    default     = ""
}

variable "ssh_username" {
    type        = string
    description = "User for SSH access to the instance"
    default     = "ubuntu"
}

variable "ssh_pubkey" {
    type        = string
    description = "SSH public key for access to the instance"
    default     = "~/.ssh/id_rsa.pub"
}
