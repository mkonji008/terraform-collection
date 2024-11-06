variable "region" {
  description = "AWS region"
  default     = "us-west-2"
}

variable "instance_type" {
  description = "instance type for kube nodes"
  default     = "t2.micro"  # free tier
}

variable "key_name" {
  description = "ssh key pair name"
  type        = string
}

