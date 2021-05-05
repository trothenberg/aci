###
# Complex flatten example
###

variable "epgs" {
    default = {
        "web" = {
            description = "Contract for web apps"
            contracts = [
                { "provides" = ["A","B"] },
                { "consumes" = ["C","D"] }
            ]
        },
        "database" = {
            description = "Contract for databases"
            contracts = [
                { "provides" = ["E","F"] },
                { "consumes" = ["G","H"] }
            ]
        }
    }
}

locals {
    epgcontracts = flatten([
        for epg_key, epg in var.epgs : [
            for contract in epg.contracts: [
                for k, v in contract: [
                    for items in v: {
                        relation = k
                        epg_name = epg_key
                        contract = items
                        desc = epg.description
                    }
                ]
            ]
        ]
    ])
}

resource "null_resource" "test" {
    for_each = {
        for key, epg in local.epgcontracts : key => epg
    }
    triggers = {
        name = each.value.epg_name
        desc = each.value.desc
        relation = each.value.relation
        contracts = each.value.contract
    }
}