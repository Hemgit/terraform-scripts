variable "ingress_ports" {
  description = "List of ports to open for ingress."
  type        = list(number)
  default     = [22, 80]
}
variable "key_name" {
  description = "The key pair name to use for the EC2 instance."
  type        = string
  default     = "test1"
}
variable "instance_type" {
  description = "The type of instance to use for the web server."
  type        = string
  default     = "t3.micro"
}

output "web_server_public_dns" {
  description = "The public DNS name of the web server instance"
  value       = aws_instance.web_server.public_dns
}
