# Crear el entorno de Desarrollo (Sin aprobadores, libre para pruebas)
resource "github_repository_environment" "env_dev" {
  for_each    = var.repositorios
  repository  = each.value
  environment = "development"
}

# Crear el entorno de Producción (Con aprobadores y reglas de ramas)
resource "github_repository_environment" "env_prod" {
  for_each    = var.repositorios
  repository  = each.value
  environment = "production"

  reviewers {
    users = var.aprobadores_usuarios
  }

  deployment_branch_policy {
    protected_branches     = false
    custom_branch_policies = true
  }
}

# Reglas de ramas para Producción: Permitir 'main'
resource "github_repository_environment_deployment_policy" "front_prod_main" {
  for_each         = var.repositorios
  repository       = each.value
  environment_name = github_repository_environment.env_prod[each.key].environment
  branch_pattern   = "main"
}