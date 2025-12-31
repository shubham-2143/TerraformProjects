resource "aws_instance" "shu" {
  ami = var.ami
  instance_type = var.type
}

resource "aws_iam_user" "my_user" {
  name = "my-iam-user"
}

