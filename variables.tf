variable "aws_default_region" {
  description = "The AWS region where resources will be created."
  type        = string
  default     = "us-east-1"
}

variable "eks_cluster_name" {
  description = "EKS Cluster name"
  type        = string
  default     = "frame_flow_cluster"
}