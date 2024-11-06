output "master_ip" {
  description = "public ip of the k8s master node"
  value       = aws_instance.k8s_master.public_ip
}

output "worker_ip" {
  description = "public ip of the k8s worker node"
  value       = aws_instance.k8s_worker.public_ip
}

output "k8s_join_command" {
  description = "k8s join command for worker nodes"
  value       = file("./k8s_join_cmd.sh")
}

