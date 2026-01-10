resource "aws_vpc" "name" {
  cidr_block = "10.0.0.0/16"
  region = "us-east-1"
  tags = {
    Name = "VPC-A"
  }
}
resource "aws_subnet" "test" {
  cidr_block = "10.0.0.0/24"
  vpc_id = aws_vpc.name.id
  availability_zone = "us-east-1a"
  tags = {
    Name = "public"
  }
}
resource "aws_subnet" "dev" {
  cidr_block = "10.0.1.0/24"
  vpc_id = aws_vpc.name.id
  availability_zone = "us-east-1b"
  tags = {
    Name = "private"
  }
}
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.name.id
}
resource "aws_route_table" "name" {
  vpc_id = aws_vpc.name.id
  tags = {
    Name = "rwt"
  }
}
resource "aws_route" "internet_access" {
  route_table_id         = aws_route_table.name.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.gw.id
}
resource "aws_route_table_association" "name" {
  route_table_id = aws_route_table.name.id
  subnet_id = aws_subnet.test.id
}
resource "aws_security_group" "web_sg" {
  description = "Allow SSH, HTTP, HTTPS"
  vpc_id = aws_vpc.name.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1" #indicates all ports
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "web-sg"
  }
}

resource "aws_instance" "name" {
  ami = "ami-068c0051b15cdb816"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.test.id
  vpc_security_group_ids = [aws_security_group.web_sg.id]
}

resource "aws_s3_bucket" "name" {
  bucket = "shubhambsontakke123"
}



