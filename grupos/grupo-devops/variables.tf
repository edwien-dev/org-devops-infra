variable "repositorios" {
  type        = set(string)
  description = "Lista de repositorios de la capa de Frontend"
  default     = ["central_devops"]
}

variable "aprobadores_usuarios" {
  type        = list(number)
  description = "IDs numéricos de GitHub de los líderes de Frontend"
  default     = [] # Reemplaza con el ID real del usuario de GitHub
}