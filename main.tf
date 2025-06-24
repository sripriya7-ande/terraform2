provider "aws" {
  region = var.region
}

# Security Group for allowing SSH, HTTP, Netdata (port 19999)
resource "aws_security_group" "vm_sg" {
  name        = "vm_sg"
  description = "Allow SSH, HTTP, Netdata"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Netdata"
    from_port   = 19999
    to_port     = 19999
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "vm_sg"
  }
}

resource "aws_instance" "amazon_linux_vm" {
  ami                    = var.ami_amazon_linux
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.vm_sg.id]

  tags = {
    Name = "c8.local"
  }

  user_data = <<-EOF
              #!/bin/bash
              hostnamectl set-hostname c8.local
              EOF
}

resource "aws_instance" "ubuntu_vm" {
  ami                    = var.ami_ubuntu
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.vm_sg.id]

  tags = {
    Name = "u21.local"
  }

  user_data = <<-EOF
              #!/bin/bash
              hostnamectl set-hostname u21.local
              EOF
}

resource "local_file" "ansible_inventory" {
  filename = "${path.module}/hosts"

  content = <<-EOT
    [frontend]
    c8.local ansible_host=${aws_instance.amazon_linux_vm.public_ip} ansible_user=ec2-user

    [backend]
    u21.local ansible_host=${aws_instance.ubuntu_vm.public_ip} ansible_user=ubuntu
  EOT

  file_permission      = "0777"
  directory_permission = "0777"
}
