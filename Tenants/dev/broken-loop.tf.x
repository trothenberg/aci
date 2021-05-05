###
# NOT SUPPORTED IN TERRAFORM
###

variable "epgs" {
    type = map
    default = {
        1 = {
            epg_name = "web"
            contracts = [
                {
                    relation = "provide"
                    ct_list = ["SSH", "HTTPS"]
                },
                {
                    relation = "consume"
                    ct_list = ["DNS", "SNMP"]
                }
            ]
        },
        2 = {
            epg_name = "db"
            contracts = [
                {
                    relation = "provide"
                    ct_list = ["SSH", "HTTPS"]
                },
                {
                    relation = "consume"
                    ct_list = ["DNS", "SNMP"]
                }
            ]
        }
    }
}

resource "null_resource" "test" {
    for_each = var.epgs
    triggers = {
        val = each.value["contracts"]
    }
}