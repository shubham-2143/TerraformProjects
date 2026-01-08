terraform {
  backend "s3" {
    bucket = "shubhamsontakke"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
