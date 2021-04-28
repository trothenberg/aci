terraform {
  required_providers {
    aci = {
      source  = "ciscodevnet/aci"
    }
  }
}

provider "aci" {
  username = var.username
  password = var.password
  url      = var.apic_url
  insecure = false
}

module "tenant" {
  source = "../../modules/tenant"
  tenant_name = var.tenant_name
}

module "vrf" {
  source = "../../modules/vrf"
  vrf_name = var.vrf_name
  tenant_id = module.tenant.tenant_id
}