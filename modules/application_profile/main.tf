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
#  annotation = "tag1,tag2"
#  name_alias = "test_ap"
#  prio       = "level1"
#relation_fv_rs_ap_mon_pol = ""
}