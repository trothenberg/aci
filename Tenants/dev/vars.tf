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

####################

variable "config" {
    type = map
    description = "Map of all tenant config"
}