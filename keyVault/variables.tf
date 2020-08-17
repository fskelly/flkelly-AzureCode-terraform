### ARM Variables, use an SPN here that has the required access
variable "ARM_SUBSCRIPTION_ID" {
    default=""
}
variable "ARM_CLIENT_ID" {
    default=""
}
variable "ARM_CLIENT_SECRET" {
    default=""
}
variable "ARM_TENANT_ID" {
    default=""
}

##no defaults defined - only placholders reamin

###==================================VARIABLES============================
###Define required varaibles, can be overrriden as needed
##Add other regions as needed
variable "locations" {
    type = map
    default = {
        "WEU"  = "westeurope"
        "weu"  = "westeurope"
        "ZAN" = "southafricanorth"
        "zan" = "southafricanorth"        
        "NEU" = "northeurope"
        "neu" = "northeurope"
    }
}

##keyvault name
variable "kvname" {
  description = "The prefix used for all resources in this example"
  default = "kv1"
}

##input variable for the locations map
variable "location" {
  description = "refer to variable locations for expected values"
}

##Pre-defined tags to be applied
variable "tags" {
  description = "Tags that will be applied to the resources"
  type = map

  default = {
    owner = "flkelly"
    createdby = "terraform"
  }
}

##Resource Group for Keyvault
variable "kv_resource_group_name" {
  description = "Name of the resource Group that will house the vms"
  default = "kv1"
}

##prefix for resource group names
variable "prefix" {
  description = "The prefix used for all resources in this example"
  default = "prefix"
}
###==============================END-VARIABLES============================