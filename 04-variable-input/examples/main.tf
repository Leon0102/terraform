terraform {
  backend "s3" {
    bucket         = "leon-nguyen-terrafrom-test-state" # REPLACE WITH YOUR BUCKET NAME
    key            = "tf-infra/04-variable-input/terraform.tfstate"
    region         = "ap-southeast-1"
    dynamodb_table = "terraform-state-locking"
    encrypt        = true
  }
}

required_providers {
  aws = {
    source  = "hashicorp/aws"
    version = "~> 3.0"
  }
}

provider "aws" {
  region = "ap-southeast-1"
}

locals {
  extra-tag = "extra-tag"
}

resource "aws_instance" "instance" {
  ami = var.ami
  instance_type = var.instance_type

  tags {
    Name = var.instance_name
    ExtraTag = local.extra-tag
  }
}

resource "aws_db_instance" "db_instance" {
  allocated_storage = 20
  storage_type = "gp2"
  engine = "postgres"
  engine_version = "12.4"
  instance_class = "db.t2.micro"
  name = "postgres"
  username = var.db_user
  password = var.db_password
  skip_final_snapshot = true
}
