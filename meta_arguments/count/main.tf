provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "web" {
    count           = 4
    ami             = "write AMI ID"
    instance_type   = "t2.micro"


    tags = {
        Name = "Mirs Test ${count.index}"
    }
}
