terraform {
  required_providers {
    aci = {
      source  = "ciscodevnet/aci"
    }
  }
}

resource "aci_tenant" "tenant" {
  name        = var.tenant_name
  description = "This tenant is created by Terraform"
#  annotation  = "tag_tenant"
#  name_alias  = "alias_tenant"

#OPTIONAL
#  relation_fv_rs_tn_deny_rule = ""
#  relation_fv_rs_tenant_mon_pol = ""
}