#create resources

data "azurerm_subscriptions" "current" {}
/*
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
*/

// create subscription budget
module "dev-budgets" {
  source  = "app.terraform.io/denniscastillo/dev-budgets/azure"
  version = "1.1.0"
  location = var.location
  email_contacts = ["casdeone@gmail.com"]
  notification_threhold = 2
}