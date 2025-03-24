# locals {
#   vm_naming_convention = join(
#     "-",
#     [
#       var.maison,
#       var.app_name,
#       join(
#         "",
#         [
#           lookup(local.subnet_role_abbreviation, var.subnet_role, substr(var.subnet_role, 0, 2)),
#           lookup(local.os_type_abbreviation, var.is_appliance ? "appliance" : var.os_type),
#           var.env,
#           var.index
#         ]
#       )
#     ]
#   )

#   vm_name = var.custom_vm_name == null ? local.vm_naming_convention : var.custom_vm_name
#   os_type_abbreviation = {
#     windows   = "w"
#     linux     = "l"
#     appliance = "a"
#   }
#   subnet_role_abbreviation = {
#     frontend   = "fe"
#     backend    = "be"
#     database   = "db"
#     paas       = "ps"
#     dmz        = "dz"
#     wallix     = "wl"
#     wallixt1   = "w1"
#     wallixt0   = "w0"
#     indexing   = "id"
#     search     = "se"
#     mngt       = "mn"
#     collection = "cl"
#     atr        = "at"
#     zscaler    = "zs"
#   }
#   env_abbreviation = {
#     PROD = {
#       env_full = "prod"
#       env_abbr = "p"
#       env_tag  = "prd"
#     }
#     STAG = {
#       env_full = "stag"
#       env_abbr = "s"
#       env_tag  = "stg"
#     }
#     INTG = {
#       env_full = "intg"
#       env_abbr = "i"
#       env_tag  = "int"
#     }
#     NPRD = {
#       env_full = "nprd"
#       env_abbr = "d"
#       env_tag  = "dev"
#     }
#   }
# }