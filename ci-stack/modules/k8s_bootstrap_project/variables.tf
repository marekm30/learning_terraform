variable "namespace_name" {
  type        = string
  description = "Kubernetes namespace name"
}

variable "serviceaccount_name" {
  type        = string
  description = "Service account name for CI/CD"
  default     = "gitlab-deployer"
}

variable "labels" {
  type        = map(string)
  description = "Labels applied to the namespace"
  default     = {}
}

variable "cpu_requests" {
  type        = string
  description = "Total CPU requests quota"
  default     = "500m"
}

variable "cpu_limits" {
  type        = string
  description = "Total CPU limits quota"
  default     = "1"
}

variable "memory_requests" {
  type        = string
  description = "Total memory requests quota"
  default     = "512Mi"
}

variable "memory_limits" {
  type        = string
  description = "Total memory limits quota"
  default     = "1Gi"
}

variable "pods_limit" {
  type        = string
  description = "Maximum number of pods"
  default     = "10"
}

variable "services_limit" {
  type        = string
  description = "Maximum number of services"
  default     = "5"
}