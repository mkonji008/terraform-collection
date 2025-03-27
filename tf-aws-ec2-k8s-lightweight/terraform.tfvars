region       = "us-west-2"
instance_type = "t2.micro" 

key_name     = "sshkeypairname"

instance_tags = {
  Name        = "k8s-inst-name"
  Environment = "dev"
  Project     = "k8s-cluster-prj-name"
}

ami_id       = "ami-0d8f6eb4f641d4849"
