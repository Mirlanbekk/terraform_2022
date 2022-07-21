provider "aws" {
  region = "us-east-1"
}


resource "aws_vpc" "main" {
	cidr_block = "10.5.0.0/16"
  tags = {
		Name = "mirs-vpc"
	}
}

resource "aws_subnet" "main" {
	vpc_id     = aws_vpc.main.id
	cidr_block = "10.5.0.0/25"

	tags = {
		Name = "mirs-subnet"
	}
}

resource "aws_instance" "web" {
	ami           = var.ami
	instance_type = "t2.micro"
	subnet_id     = aws_subnet.main.id

	tags = {
		Name = var.ec2_name
	}
}