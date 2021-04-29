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

variable "bd_name" {
  type = string
  description = "Name of Bridge Domain"
}

variable "ap_name" {
    type = string
    description = "Application Profile name"
}

variable "bd_ip" {
    type = string
    description = "Bridge Domain IP address"
}

variable "app_epg_name" {
    type = string
    description = "Application EPG name"
}

variable "ct_name" {
    type = string
    description = "Contract name"
}

variable "subject_name" {
    type = string
    description = "Subject name"
}