variable "saname" {
  type        = string
  description = "Name of storage account"
}
variable "rgname" {
  type        = string
  description = "Name of resource group"
}
variable "location" {
  type        = string
  description = "Azure location of storage account environment"
  default     = "northeurope"
}

variable "rgLocation" {
  type        = string
  description = "Azure location of resource"
  default     = "northeurope"
}

variable "purpose" {
  type        = string
  description = "What is the function of this deployment"
  default     = "northeurope"
}

variable "prefix" {
  type        = string
  description = "Prefix"
  default     = "fskelly"
}

variable "vnetName" {
  description = "Vnet Name"
}

variable "kvRGLocation" {
  type        = string
  description = "name oif the Keyvault Resource Group"
  default     = "northeurope"
}

variable "vm_username" {
  description = "VM administrator username"
  type        = string
  sensitive   = true
}

variable "vm_password" {
  description = "VM administrator password"
  type        = string
  sensitive   = true
}

//variable "kvID" {
// description = "ID for Keyvault"
//type        = string
//}