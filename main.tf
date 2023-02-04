#create resources

data "azurerm_subscriptions" "current" {}
module "compute" {
  source  = "app.terraform.io/denniscastillo/compute/azure"
  #source = "github.com/casdeone/terraform-azure-compute.git?ref=v.1.1.0"
  version = "1.0.0"
  location = "WestUS3"
  prefix = "casdeone"
  vm_prefix = "dev"
  environment = "nonprod"
  vm_size = "Standard_DS1_v2"
}

// create resource group
resource azurerm_resource_group "dev_rg" {
  name = "dev-rg"
  location = "WestUS3"
}
module "dev-budgets" {
  source  = "app.terraform.io/denniscastillo/dev-budgets/azure"
  version = "1.0.7"
  location = azurerm_resource_group.dev_rg.location
  resource_group_name = azurerm_resource_group.dev_rg.name
  email_contact = ["casdeone@gmail.com"]
  subscription_name = data.azurerm_subscriptions.current.display_name_prefix
  subscription_id = data.azurerm_subscriptions.current.id
}