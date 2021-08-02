variable "rgName" {
  type        = string
  description = "Name of resource Group"
}

variable "rgLocation" {
  type        = string
  description = "Azure location of resource group"
  default     = "northeurope"
}
#variable "saReplicationType" {
#    type = string
#    description = "Replication type - LRS or GRS"
#    default = "GRS"
#}