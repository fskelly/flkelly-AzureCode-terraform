variable "pipName" {
  description = "Name for public IP"
  type        = string
}

variable "pipRGName" {
  type        = string
  description = "name of the PIP Resource Group"
}

variable "pipRGLocation" {
  type        = string
  description = "Location of the PIP Resource Group"
}