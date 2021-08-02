resource "azurerm_network_interface" "winvmnic" {
  name     = var.vmNicName
  location = var.nicLocation
  //location            = azurerm_resource_group.example.location
  resource_group_name = var.nicRGName
  //resource_group_name = azurerm_resource_group.example.name

  ip_configuration {
    name = "internal"
    //subnet_id                     = azurerm_subnet.example.id
    subnet_id                     = var.subnetID
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = var.pipID
  }
}

resource "azurerm_windows_virtual_machine" "winvm" {
  name = var.vmName
  //resource_group_name = azurerm_resource_group.example.name
  resource_group_name = var.vmRGName
  //location            = azurerm_resource_group.example.location
  location       = var.vmRGLocation
  size           = "Standard_A1"
  //admin_username = "adminuser"
  admin_username = var.vmUserName
  //admin_password = "P@$$w0rd1234!"
  admin_password = var.vmUserPassword
  network_interface_ids = [
    azurerm_network_interface.winvmnic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}