module "security" {
  source = "../../modules/security"

  environment = var.environment
  project     = var.project
}

module "storage" {
  source = "../../modules/storage"

  environment = var.environment
  project     = var.project
}

module "compute" {
  source = "../../modules/compute"

  environment = var.environment
  project     = var.project
}

module "monitoring" {
  source = "../../modules/monitoring"

  environment = var.environment
  project     = var.project
}
