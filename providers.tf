terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "2.13.0"
    }
  }
}

provider "docker" {}

provider "aws" {
  region = "us-east-1"
}
resource "docker_image" "centos" {
    name = "centos:latest"
}
