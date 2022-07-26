output "test" {
    value  = aws_instance.web[*].public_ip
}