terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.0"
    }
  }
}

provider "local" {}

resource "local_file" "arjun_file" {
  content  = "Hello from Terraform inside Gitpod!"
  filename = "${path.module}/hello_arjun.txt"
}
