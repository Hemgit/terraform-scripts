variable "key_name" {
  description = "The key pair name to use for the EC2 instance."
  type        = string
  default     = "test1"
}
variable "image_id" {
  description = "The AMI ID to use for the web server instance."
  type        = string
  default     = "ami-04c08fd8aa14af291"
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
