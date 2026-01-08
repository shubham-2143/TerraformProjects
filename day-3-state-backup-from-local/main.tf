resource "aws_instance" "shbm" {
  ami = "ami-068c0051b15cdb816"
  instance_type = "t2.medium"
  tags = {
    Name = "qa"
  }

}

resource "aws_s3_bucket" "shbm" {
  bucket = "shubhamruchi143"
}

