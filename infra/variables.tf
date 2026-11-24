variable "region" {
  description = "Région AWS."
  type        = string
  default     = "eu-north-1"
}

variable "budget_email" {
  description = "Adresse qui reçoit l'alerte de budget. Valeur locale, hors dépôt (terraform.tfvars)."
  type        = string
  sensitive   = true
}

variable "budget_limit_usd" {
  description = "Plafond mensuel en dollars."
  type        = number
  default     = 20
}
