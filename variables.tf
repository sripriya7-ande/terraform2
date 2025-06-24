variable "vpc_id" {
  description = "Existing VPC ID"
  default     = "vpc-094eeb2b40d546e07"
}

variable "subnet_id" {
  description = "Subnet ID inside the above VPC"
  default     = "subnet-06e5859208fb840f5"
}

variable "key_name" {
  description = "EC2 Key Pair Name"
  default     = "Ansible01"
}
