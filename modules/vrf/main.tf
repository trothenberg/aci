terraform {
  required_providers {
    aci = {
      source  = "ciscodevnet/aci"
    }
  }
}

resource "aci_vrf" "BeatLabratory" {
  tenant_dn              = var.tenant_id
  name                   = var.vrf_name
  ip_data_plane_learning = "enabled"
  knw_mcast_act          = "permit"
  pc_enf_dir             = "ingress"
  pc_enf_pref            = "enforced"
}