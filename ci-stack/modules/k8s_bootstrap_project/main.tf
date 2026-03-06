resource "kubernetes_namespace_v1" "this" {
  metadata {
    name   = var.namespace_name
    labels = var.labels
  }
}

resource "kubernetes_resource_quota_v1" "this" {
  metadata {
    name      = "default-quota"
    namespace = kubernetes_namespace_v1.this.metadata[0].name
  }

  spec {
    hard = {
      "requests.cpu"    = var.cpu_requests
      "limits.cpu"      = var.cpu_limits
      "requests.memory" = var.memory_requests
      "limits.memory"   = var.memory_limits
      "pods"            = var.pods_limit
      "services"        = var.services_limit
    }
  }
}

resource "kubernetes_limit_range_v1" "this" {
  metadata {
    name      = "default-limits"
    namespace = kubernetes_namespace_v1.this.metadata[0].name
  }

  spec {
    limit {
      type = "Container"

      default = {
        cpu    = "500m"
        memory = "512Mi"
      }

      default_request = {
        cpu    = "100m"
        memory = "128Mi"
      }
    }
  }
}

resource "kubernetes_service_account_v1" "this" {
  metadata {
    name      = var.serviceaccount_name
    namespace = kubernetes_namespace_v1.this.metadata[0].name
  }
}