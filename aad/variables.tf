variable "globals" {
  type = object({
    env = string
  })
  default = {
    env = "dev"
  }
}

// Default
variable "context" {
  description = "What context resources should live in"
  default     = "core"
}

variable "product" {
  description = "What product the resources belong to"
}

// Role Assignments
variable "rg_core_001" {
  description = "Primary resource group"
}

variable "sp_terraform_001_rg_core_001_role" {
  description = "Name of role to assign sp_terraform to rg_core"
  default     = "Contributor"
}
