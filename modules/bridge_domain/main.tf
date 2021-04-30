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
#  optimize_wan_bandwidth      = "no"
#  annotation                  = "tag_bd"
#  arp_flood                   = "no"
#  ep_clear                    = "no"
#  ep_move_detect_mode         = "garp"
#  host_based_routing          = "no"
#  intersite_bum_traffic_allow = "yes"
#  intersite_l2_stretch        = "yes"
#  ip_learning                 = "yes"
#  ipv6_mcast_allow            = "no"
#  limit_ip_learn_to_subnets   = "yes"
#  mac                         = "00:22:BD:F8:19:FF"
#  mcast_allow                 = "yes"
#  multi_dst_pkt_act           = "bd-flood"
#  name_alias                  = "alias_bd"
#  bridge_domain_type          = "regular"
#  unicast_route               = "no"
#  unk_mac_ucast_act           = "flood"
#  unk_mcast_act               = "flood"
#  vmac                        = "not-applicable"

#OPTIONAL
#  relation_fv_rs_bd_to_profile = ""
#  relation_fv_rs_mldsn = ""
#  relation_fv_rs_abd_pol_mon_pol = ""
#  relation_fv_rs_bd_to_nd_p = ""
#  relation_fv_rs_bd_flood_to = ""
#  relation_fv_rs_bd_to_fhs = ""
#  relation_fv_rs_bd_to_relay_p = ""
#  relation_fv_rs_bd_to_netflow_monitor_pol = ""
#  relation_fv_rs_igmpsn = ""
#  relation_fv_rs_bd_to_ep_ret = ""
#  relation_fv_rs_bd_to_out = ""
}

resource "aci_subnet" "subnet" {
  parent_dn                           = aci_bridge_domain.bd.id
  ip                                  = var.bd_ip
  scope                               = [ "private" ] #private*, shared, public
  description                         = "This subject is created by Terraform"
#  annotation       = "tag_subnet"
#  ctrl             = ["querier", "nd"] #querier, nd*, no-default-gateway, unspecified
#  name_alias       = "alias_subnet"
#  preferred        = "no" #yes, no*
#  virtual          = "yes"

#OPTIONAL
#  relation_fv_rs_bd_subnet_to_out = ""
#  relation_fv_rs_nd_pfx_pol = ""
#  relation_fv_rs_bd_subnet_to_profile = ""
}