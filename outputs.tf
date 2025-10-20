output "web_server_public_ip" {
  description = "The public IP addresses of the web server instances"
  value       = aws_instance.web_server[*].public_ip
}
