output "module_node" {
  description = "Recursos gerados pelo modulo node-group"
  value       = aws_eks_node_group.workers
}

