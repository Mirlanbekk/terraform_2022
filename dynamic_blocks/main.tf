provider "aws" {
    region = "us-east-1"
}

locals {
    ingress_rules = [{
        port        = 443
        description = "Port 443"

    },
    {
        port        = 80
        description = "Port 80"
    }]
}

data "aws_vpc" "main" {
    default = true
}

resource "aws_security_group" "main" {
    name    = "mir"
    vpc_id  = data.aws_vpc.main.id

    dynamic "ingress" {
        for_each = local.ingress_rules

        content {
            description     = ingress.value.description
            from_port       = ingress.value.port
            to_port         = ingress.value.port
            protocol        = "tcp"
            cidr_blocks     = ["0.0.0.0/0"]
        }
    }

    tags = {
        Name = "Mirs security group"
    }
}