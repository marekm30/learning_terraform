terraform {
  required_version = ">= 1.14.0"

  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 3.0.0"
    }
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

module "monitoring" {
  source = "../../modules/k8s_bootstrap_project"

  namespace_name      = "monitoring"
  serviceaccount_name = "monitoring-sa"

  labels = {
    team = "monitoring"
    env  = "dev"
  }

  cpu_requests    = "1"
  cpu_limits      = "2"
  memory_requests = "1Gi"
  memory_limits   = "2Gi"
  pods_limit      = "20"
  services_limit  = "10"
}