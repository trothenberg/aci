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

module "bd" {
  source = "../../modules/bridge_domain"
  tenant_id = module.tenant.tenant_id
  vrf_id = module.vrf.vrf_id
  bd_name = var.bd_name
  bd_ip = var.bd_ip
}

module "ap" {
  source = "../../modules/application_profile"
  tenant_id = module.tenant.tenant_id
  ap_name = var.ap_name
}

#module "epg" {
#  source = "../../modules/app_epg"
#  tenant_id = module.tenant.tenant_id
#  ap_id = module.ap.ap_id
#}

#module "contract" {
#  source = "../../modules/contracts"
#  tenant_id = module.tenant.tenant_id
#  ct_name = var.ct_name
#  subject_name = var.subject_name
#}