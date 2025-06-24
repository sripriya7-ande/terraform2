variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "vpc_id" {
  description = "Existing VPC ID"
}

variable "subnet_id" {
  description = "Subnet ID inside the above VPC"
}

variable "key_name" {
  description = "Ansible01"
}

variable "ami_amazon_linux" {
  description = "AMI ID for Amazon Linux"
  default     = "ami-0f3f13f145e66a0a3"
}

variable "ami_ubuntu" {
  description = "AMI ID for Ubuntu"
  default     = "ami-020cba7c55df1f615"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}
