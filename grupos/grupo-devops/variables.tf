variable "repositorios" {
  type        = set(string)
  description = "Lista de repositorios de la capa de Frontend"
  default     = ["nor-devops"]
}

variable "aprobadores_usuarios" {
  type        = list(number)
  description = "IDs numéricos de GitHub de los líderes de Frontend"
  default     = [170660482] # Reemplaza con el ID real del usuario de GitHub
}