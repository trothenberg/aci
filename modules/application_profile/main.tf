terraform {
  required_providers {
    aci = {
      source  = "ciscodevnet/aci"
    }
  }
}

resource "aci_application_profile" "ap" {
  tenant_dn   = var.tenant_id
  name        = var.ap_name
  description = "This app profile is created by terraform"
}