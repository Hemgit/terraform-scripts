resource "null_resource" "local_exec_example" {
  provisioner "local-exec" {
    command = "echo welcome to terraform V1 > index.html"
  }
}

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_instance" "web_server" {
  provisioner "remote-exec" {
    inline = [
      "echo 'hemanth is my name' | sudo tee /tmp/index.html",
      "sleep 120",
      "sudo mv /tmp/index.html /var/www/html/index.html"
    ]

    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("test1.pem")
      host        = self.public_ip
      timeout     = "5m"
    }
  }
  provisioner "file" {
    source      = "index.html"
    destination = "/tmp/index.html"

    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("test1.pem")
      host        = self.public_ip
      timeout     = "5m"
   
    }
  }
  count = 2
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = var.instance_type
     vpc_security_group_ids = [aws_security_group.webserver_sg.id]
  key_name               = var.key_name
  user_data = file("userdata.sh")

  tags = {
    Name = "webserver-${count.index + 1}"
  }
}

