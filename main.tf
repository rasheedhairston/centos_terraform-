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

resource "aws_ecr_repository" "sheed-repo" {
    name = "sheed-repo"
}

resource "aws_ecs_cluster" "sheed_cluster" {
  name = "sheed-cluster"
 }
 
 resource "aws_ecs_task_definition" "sheed_task" {
  family = "sheed-task"
  container_definitions = DEFINITION
  [
    {
      "name"   :  "sheed",
      "image"  : "aws_ecr_repository.sheed_repo.repository_url"
      "essential": true
      "portMappings" : [
        {
          containerPort = 80
          hostPort      = 80
        }
      ],
      "cpu"    : 10,
      "memory" : 512
  }
]
 DEFINITION
 requires_compatibilities = ["FAEGATE"]
 network_mode = "awsvpc"
 memory = 512
 cpu = 10
 }
   
