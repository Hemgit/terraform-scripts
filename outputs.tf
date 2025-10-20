output "web_server_public_ip" {
  description = "The public IP addresses of the web server instances"
  value       = aws_instance.web_server[*].public_ip
}

output "web_server_public_dns" {
  description = "The public DNS name of the web server instance"
  value       = aws_instance.web_server[*].public_dns
}
