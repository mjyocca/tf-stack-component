terraform {
  required_providers {
    null = {
      source = "hashicorp/null"
      version = "3.1.1"
    }
  }
}

variable "pet" {
  type = string
}

variable "instances" {
  type = number
}

resource "null_resource" "this" {
  count = var.instances

  triggers = {
    pet = var.pet
  }
}

resource "null_resource" "test" {}
resource "null_resource" "test_2" {}
resource "null_resource" "test_3" {}
resource "null_resource" "test_4" {}
resource "null_resource" "test_5" {}
resource "null_resource" "test_6" {}

output "ids" {
  value = [for n in null_resource.this: n.id]
}

