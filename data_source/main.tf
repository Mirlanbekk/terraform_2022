provider "aws" {
  region  = "us-east-1"
}

data "aws_vpc" "default" {
    filter {
        name = "tag:Name"
        values = ["default"]
    }
}

resource "aws_subnet" "web" {
    vpc_id = data.aws_vpc.default.id
    cidr_block = "10.0.0.0/16"
}
resource "aws_instance" "web" {
  ami           = "ami id"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.web.id


  tags = {
      Name = "EC2_Mir"
  }
} 

