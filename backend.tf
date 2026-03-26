terraform {
  backend "s3" {
    bucket = "raghu-tf-state-bucket"
    key    = "eks/terraform.tfstate"
    region = "ap-south-1"
  }
}
