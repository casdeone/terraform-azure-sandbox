#create resources
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

module "dev-budgets" {
  source  = "app.terraform.io/denniscastillo/dev-budgets/azure"
  version = "1.0.2"
  location = "westus3"
  resource_group_name = "dts-rg"
  email_contact = ["casdeone@gmail.com"]
}