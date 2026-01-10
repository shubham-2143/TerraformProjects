terraform {
  backend "s3" {
    bucket = "shubhamsontakke"
    key    = "terraform.tfstate"
    region = "us-east-1"
    #use_lockfile = true tarraform version should be above 1.10
    dynamodb_table = "abcd"
  }
}
