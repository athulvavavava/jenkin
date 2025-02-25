terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-2"
}

# VPC and Networking Components
resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "my-vpc"
  }
}

resource "aws_subnet" "pubsub" {
  availability_zone     = "us-east-2c"
  vpc_id                = aws_vpc.myvpc.id
  cidr_block            = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "pub-sub"
  }
}

resource "aws_subnet" "sub1" {
  availability_zone     = "us-east-2a"
  vpc_id                = aws_vpc.myvpc.id
  cidr_block            = "10.0.3.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "sub1-sub"
  }
}
