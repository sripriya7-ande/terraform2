variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "vpc_id" {
  description = "Existing VPC ID"
  default     = "vpc-029a0b8e705fd2daa"
}

variable "subnet_id" {
  description = "Subnet ID inside the above VPC"
  default     = "subnet-0bff81c8697e02fe5"
}

variable "security_group_id" {
  description = "Security Group ID"
  default     = "sg-057d2913e45a6a15f"
}

variable "key_name" {
  description = "Key Pair name"
  default     = "jenkins" # Make sure this key pair exists in us-east-1
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "ami_amazon_linux" {
  description = "Amazon Linux 2 AMI ID"
  default     = "ami-000ec6c25978d5999"
}

variable "ami_ubuntu" {
  description = "Ubuntu 24.04 AMI ID"
  default     = "ami-020cba7c55df1f615"
}
