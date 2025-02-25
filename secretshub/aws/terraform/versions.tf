terraform {
  required_version = ">= 1.0.0"

  required_providers {
    cyberark = {
      source  = "registry.terraform.io/cyberark/cyberark"
      version = "~> 0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}