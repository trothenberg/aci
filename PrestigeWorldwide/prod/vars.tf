variable "username" {
    type = string
    description = "APIC username"
}

variable "password" {
    type = string
    description = "APIC password"
}

variable "apic_url" {
    type = string
    description = "APIC URL or IP"
}

variable "tenant_name" {
    type = string
    description = "Name of the tenant"
}

variable "vrf_name" {
    type = string
    description = "Name(s) of the VRF(s)"
}