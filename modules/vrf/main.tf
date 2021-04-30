terraform {
  required_providers {
    aci = {
      source  = "ciscodevnet/aci"
    }
  }
}

resource "aci_vrf" "vrf" {
  tenant_dn              = var.tenant_id
  name                   = var.vrf_name
#  annotation             = "tag_vrf"
#  bd_enforced_enable     = "no"
#  ip_data_plane_learning = "enabled"
#  knw_mcast_act          = "permit"
#  name_alias             = "alias_vrf"
#  pc_enf_dir             = "egress"
#  pc_enf_pref            = "unenforced"

#OPTIONAL
# relation_fv_rs_ospf_ctx_pol = ""
# relation_fv_rs_vrf_validation_pol = ""
# relation_fv_rs_ctx_mcast_to = ""
# relation_fv_rs_ctx_to_eigrp_ctx_af_pol = ""
# relation_fv_rs_ctx_to_ospf_ctx_pol = ""
# relation_fv_rs_ctx_to_ep_ret = ""
# relation_fv_rs_bgp_ctx_pol = ""
# relation_fv_rs_ctx_mon_pol = ""
# relation_fv_rs_ctx_to_ext_route_tag_pol = ""
# relation_fv_rs_ctx_to_bgp_ctx_af_pol = ""
}