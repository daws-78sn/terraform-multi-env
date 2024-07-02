terraform {
  required_providers {
	aws = {
	  source = "hashicorp/aws"
	  version = "5.48.0"
	}
  }
}

backend "s3" {
	bucket = "daws78s-remote-state" # must be unique
	key = "workspace"
	region = "us-east-1"
	dynamodb = "daws78s-locking" #this also unique
}
provider "aws" {
 region = "us-east-1"
}