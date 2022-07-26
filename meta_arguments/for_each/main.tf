provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "web" {
	for_each = {
		size1 = "t2.micro"
		size2 = "t2.large"
	}
	ami           = "write AMI ID"
	instance_type = each.value
	tags = {
		Name = each.key
	}
}