variable "poc_name" {
  description = "Name of the POC"
  default     = "secretsHubPOC"
}

variable "resource_group" {
  description = "The name of the resource group in which to create the environment."
  default     = "secretsHubPOCRG"
}

variable "admin_username" {
  description = "The administrator username for the VM."
  default     = "secretsHubPOCAdmin"
}

variable "admin_password" {
  description = "The administrator password for the VM."
}

variable "vm_size" {
  description = "The size of the VM that will be created."
  default     = "Standard_DS1_v2"
}

variable "tenant_id" {
  description = "The Azure tenant ID."
}