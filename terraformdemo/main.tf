resource "random_id" "suffix" {
  byte_length = 8
}

module "resourceGroup" {
  source     = "./modules/resource-group"
  rgName     = "tf-playground"
  rgLocation = var.rgLocation
}

#Create Storage Account
module "sa" {
  source     = "./modules/storage-account"
  saName     = "tfsta${lower(random_id.suffix.hex)}"
  saRGNname  = module.resourceGroup.rgName
  saLocation = module.resourceGroup.rgLocation
  //saReplicationType   = "GRS"
}

module "vnet" {
  source       = "./modules/vnet"
  vnetName     = var.vnetName
  vnetRGName   = module.resourceGroup.rgName
  vnetPrefix   = "fskvnet"
  vnetLocation = module.resourceGroup.rgLocation
}

module "winvm" {
  source       = "./modules/windows-virtual-machine"
  nicLocation  = module.resourceGroup.rgLocation
  nicRGName    = module.resourceGroup.rgName
  vmRGName     = module.resourceGroup.rgName
  vmRGLocation = module.resourceGroup.rgLocation
  subnetID     = module.vnet.backendSubnetID
  vmName       = substr("tfvm${lower(random_id.suffix.hex)}", 0, 14)
  vmNicName       = "${substr("tfvm${lower(random_id.suffix.hex)}", 0, 14)}-nic"
  vmUserName      = module.secrets.userName
  vmUserPassword  = module.secrets.userPassword
  pipID = module.pip.pipID
}

module "keyvault" {
  source       = "./modules/key-vault"
  kvRGLocation = module.resourceGroup.rgLocation
  kvRGName     = module.resourceGroup.rgName
  kvName       = "tfkv${lower(random_id.suffix.hex)}"
}

module "secrets" {
  source      = "./modules/secrets"
  vm_username = var.vm_username
  vm_password = var.vm_password
  kvID        = module.keyvault.kvID
}

module "pip" {
  source = "./modules/public-ip-address"
  pipName   = "tfpip${lower(random_id.suffix.hex)}"
  pipRGLocation = module.resourceGroup.rgLocation
  pipRGName = module.resourceGroup.rgName

}