###
# FLATTEN EXAMPLE
###

variable "epgs" {
    type = map
    default = {
        1 = {
            epg_name = "web"
            contracts = [ "A", "B", "C" ]
        }
        2 = {
            epg_name = "db"
            contracts = [ "D", "E", "F" ]
        }
    }
}

locals {
    epgcontracts = flatten([
        for epg_key, epg_value in var.epgs : [
            for contractlist in epg_value.contracts : {
            contractitems = contractlist
            }
        ]
    ])
}

resource "null_resource" "test" {
    for_each = {
        for epg in local.epgcontracts : epg.contractitems => epg
    }
    triggers = {
        val = each.value.contractitems
    }
}