terraform {
  required_providers {
    aci = {
      source  = "ciscodevnet/aci"
    }
  }
}

resource "aci_bridge_domain" "bd" {
  tenant_dn   = var.tenant_id
  name        = var.bd_name
  relation_fv_rs_ctx = var.vrf_id
  description = "This bridge domain is created by the Terraform ACI provider"
}

resource "aci_subnet" "subnet" {
  parent_dn                           = aci_bridge_domain.bd.id
  ip                                  = var.bd_ip
  scope                               = [ "private" ]
  description                         = "This subject is created by Terraform"
}