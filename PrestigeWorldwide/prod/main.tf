terraform {
  required_providers {
    aci = {
      source  = "ciscodevnet/aci"
    }
  }
}

provider "aci" {
  username = "admin"
  password = "ciscopsdt"
  url      = "https://sandboxapicdc.cisco.com"
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