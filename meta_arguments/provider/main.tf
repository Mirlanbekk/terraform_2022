provider "aws" {
    region = "us-east-1"
}

provider "aws" {
    alias = "west"
    region = "us-west-1"
}

resource "aws_instance" "web-west" {
    provider = "aws.west"
    ami             = "write AMI ID"
    instance_type   = "t2.micro"

    tags = {
        Name = "web-west"
    }

}

resource "aws_instance" "web" {
    ami             = "write AMI ID"
    instance_type   = "t2.micro"

    tags = {
        Name = "web-east"
    }

}
