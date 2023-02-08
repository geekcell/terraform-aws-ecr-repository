terraform {
  required_version = ">= 1.3"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.36"
    }

    jq = {
      source  = "massdriver-cloud/jq"
      version = "0.2.1"
    }
  }
}
