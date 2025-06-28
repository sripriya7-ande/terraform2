variable "region" {
  default = "us-east-1"
}

variable "vpc_id" {
  default = "vpc-029a0b8e705fd2daa"
}

variable "subnet_id" {
  default = "subnet-0bff81c8697e02fe5"
}

variable "security_group_id" {
  default = "sg-057d2913e45a6a15f"
}

variable "key_name" {
  default = "New"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ami_amazon_linux" {
  default = "ami-000ec6c25978d5999"
}

variable "ami_ubuntu" {
  default = "ami-020cba7c55df1f615"
}
