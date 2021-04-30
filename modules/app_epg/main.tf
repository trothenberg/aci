terraform {
  required_providers {
    aci = {
      source  = "ciscodevnet/aci"
    }
  }
}

resource "aci_application_epg" "app_epg" {
  application_profile_dn  = "${aci_application_profile.app_profile_for_epg.id}"
  name                              = "demo_epg"
  description                   = "%s"
#  annotation                    = "tag_epg"
#  exception_tag                 = "0"
#  flood_on_encap            = "disabled"
#  fwd_ctrl                      = "none"
#  has_mcast_source             = "no"
#  is_attr_based_epg         = "no"
#  match_t                          = "AtleastOne"
#  name_alias                  = "alias_epg"
#  pc_enf_pref                  = "unenforced"
#  pref_gr_memb                  = "exclude"
#  prio                              = "unspecified"
#  shutdown                      = "no"

#OPTIONAL
#  relation_fv_rs_bd
#  relation_fv_rs_cust_qos_pol
#  relation_fv_rs_fc_path_att
#  relation_fv_rs_prov
#  relation_fv_rs_graph_def
#  relation_fv_rs_sec_inherited
#  relation_fv_rs_node_att
#  relation_fv_rs_dpp_pol
#  relation_fv_rs_cons
#  relation_fv_rs_prov_def
#  relation_fv_rs_trust_ctrl
#  relation_fv_rs_prot_by
#  relation_fv_rs_aepg_mon_pol
#  relation_fv_rs_intra_epg
}