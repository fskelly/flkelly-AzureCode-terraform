variable "nicRGName" {
  type        = string
  description = "Name of resource group"
}
variable "nicLocation" {
  type        = string
  description = "Azure location of VM NIC"
  default     = "northeurope"
}
variable "vmRGName" {
  type        = string
  description = "Name of the Resource Group for the VM"
}
variable "vmRGLocation" {
  type        = string
  description = "location of the Resource Group for the VM"
}
variable "subnetID" {
  type        = string
  description = "Id of required subnet"
}
variable "vmNicName" {
  type        = string
  description = "Name of the Virtual Machine NIC"
}
variable "vmName" {
  type        = string
  description = "Name of the Virtual Machine NIC"
}

variable "vmUserName" {
  type        = string
  description = "User Name of the Virtual Machine NIC"
}

variable "vmUserPassword" {
  type        = string
  description = "User password of the Virtual Machine NIC"
}

variable "pipID" {
  type        = string
  description = "Public IP ID"
}