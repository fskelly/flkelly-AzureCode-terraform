variable "saName" {
  type        = string
  description = "Name of storage account"
}
variable "saRGNname" {
  type        = string
  description = "Name of resource group"
}
variable "saLocation" {
  type        = string
  description = "Azure location of storage account environment"
  default     = "northeurope"
}
variable "saReplicationType" {
  type        = string
  description = "Replication type - LRS or GRS"
  default     = "GRS"
}