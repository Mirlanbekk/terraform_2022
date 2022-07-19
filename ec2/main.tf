provider "aws" {
  region  = "us-east-1"
}

resource "aws_instance" "web" {
  ami           = "Write AMI ID"
  instance_type = "t2.micro"


  tags = {
      Name = "EC2_Mir"
  }
}
