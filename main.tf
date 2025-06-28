provider "aws" {
  region = var.region
}

resource "aws_instance" "amazon_linux_vm" {
  ami                    = var.ami_amazon_linux
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]

  tags = {
    Name = "Amazon-Linux-Server"
  }

  user_data = <<-EOF
              #!/bin/bash
              hostnamectl set-hostname amazon.local
              EOF
}

resource "aws_instance" "ubuntu_vm" {
  ami                    = var.ami_ubuntu
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]

  tags = {
    Name = "Ubuntu-Server"
  }

  user_data = <<-EOF
              #!/bin/bash
              hostnamectl set-hostname ubuntu.local
              EOF
}

resource "local_file" "ansible_inventory" {
  filename = "${path.module}/hosts"

  content = <<-EOT
    [frontend]
    c8.local ansible_host=${aws_instance.amazon_linux_vm.public_ip} ansible_user=ec2-user ansible_ssh_private_key_file=~/.ssh/jenkins.pem

    [backend]
    u21.local ansible_host=${aws_instance.ubuntu_vm.public_ip} ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/jenkins.pem
  EOT

  file_permission      = "0777"
  directory_permission = "0777"
}
