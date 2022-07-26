output "web" {
    value = [for instance in aws_instance.web : instance.public_ip]
}