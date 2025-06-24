variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "vpc_id" {
  description = "Existing VPC ID"
  default     = "vpc-0b23deca78dbcdfc7"
}

variable "subnet_id" {
  description = "Subnet ID inside the above VPC"
  default     = "subnet-028ebfc5aa672d8b6"
}

variable "security_group_id" {
  description = "Security Group ID"
  default     = "sg-00dd35d245995813f"
}

variable "key_name" {
  description = "Key Pair name"
  default     = "jenkins"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "ami_amazon_linux" {
  description = "Amazon Linux 2 AMI ID"
  default     = "ami-0f3f13f145e66a0a3"
}

variable "ami_ubuntu" {
  description = "Ubuntu 24.04 AMI ID"
  default     = "ami-020cba7c55df1f615"
}
