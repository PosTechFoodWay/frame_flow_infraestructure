variable "aws_region" {
  type        = string
  description = "AWS Region where infrastructure is deployed"
  default     = "us-east-1"
}

variable "additional_tags" {
  type        = map(string)
  description = "additional tags on resources"
}

variable "resource_prefix" {
  type        = string
  description = "Prefix for resources created in this module"
}

variable "component_prefix" {
  type        = string
  description = "Specific prefix for this component"
}

variable "engine" {
  type = string
}

variable "engine_version" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "vpc_security_group_ids" {
  type = list(string)
}

variable "username" {
  type = string
}

variable "password" {
  type = string
}


variable "instance_class" {
  type = string
}

variable "skip_final_snapshot" {
  type = string
}

variable "db_name" {
  type = string
}

variable "allocated_storage" {
  type = number
}

variable "performance_insights_enabled" {
  type = bool
}

variable "performance_insights_kms_key_id" {
  type = string
}