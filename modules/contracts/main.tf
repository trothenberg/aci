terraform {
  required_providers {
    aci = {
      source  = "ciscodevnet/aci"
    }
  }
}

resource "aci_contract" "contract" {
    tenant_dn   = var.tenant_id
    description = "%s"
    name        = var.ct_name
    annotation  = "tag_contract"
    name_alias  = "alias_contract"
    prio        = "level1"
    scope       = "tenant"
    target_dscp = "unspecified"
    filter {
          annotation  = "tag_filter"
          description = "first filter from contract resource"
          filter_entry {
                entry_description   = "hello world"
            filter_entry_name   = "check_entry3"
                d_from_port         = "http"
                ether_t             = "ipv4"
                prot            = "tcp"  
          }
          filter_entry {
                entry_description   = "world"
            filter_entry_name   = "check_entry1"
                d_from_port         = "443"
                ether_t             = "ipv4"
                prot            = "tcp"  
          }
          filter_name  = "abcd"
          name_alias   = "abcd"
    }
    filter {
          filter_name = "example2"
          description = "second filter from contract resource"
          annotation = "tag_filter"
          name_alias = "example2"
    }
}

resource "aci_contract_subject" "subject" {
    contract_dn   = aci_contract.contract.id
    description   = "%s"
    name          = var.subject_name
    annotation    = "tag_subject"
    cons_match_t  = "AtleastOne"
    name_alias    = "alias_subject"
    prio          = "level1"
    prov_match_t  = "AtleastOne"
    rev_flt_ports = "yes"
    target_dscp   = "CS0"
}

resource "aci_filter" "filter" {
    tenant_dn   = var.tenant_id
    description = "%s"
    name        = "demo_filter"
    annotation  = "tag_filter"
    name_alias  = "alias_filter"
}

resource "aci_filter_entry" "filter" {
    filter_dn     = aci_filter.filter.id
    description   = "%s"
    name          = "demo_entry"
    annotation    = "tag_entry"
    apply_to_frag = "no"
    arp_opc       = "unspecified"
    d_from_port   = "unspecified"
    d_to_port     = "unspecified"
    ether_t       = "ipv4"
    icmpv4_t      = "unspecified"
    icmpv6_t      = "unspecified"
    match_dscp    = "CS0"
    name_alias    = "alias_entry"
    prot          = "icmp"
    s_from_port   = "0"
    s_to_port     = "0"
    stateful      = "no"
    #tcp_rules     = ""
}