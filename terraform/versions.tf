terraform {
    required_version = ">= 1.0.0"

    required_providers {
        conjur = {
            source = "cyberark/conjur"
        }
    }
}