variable "region" {
  description = "AWS region"
  default     = "us-west-2"
}

variable "instance_type" {
  description = "instance type for kube nodes"
  default     = "t2.micro"  # free tier ofc
}

variable "key_name" {
  description = "ssh key pair name"
  type        = string
}

variable "instance_tags" {
  description = "tags to apply to the ec2 instances"
  type = map(string)
  default = {
    Name        = "k8s-instance-name"
    Environment = "dev-qc-testing-prod...etc"
    Project     = "k8s-cluster-project-name"
  }
}
