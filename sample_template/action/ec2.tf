provider "aws" {
  region = var.region
}

resource "aws_instance" "web" {
  ami           = "ami image"
  instance_type = "t2.micro"


  tags = {
    Name = "EC2_Mir"
  }
}