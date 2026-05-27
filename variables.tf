variable "queue_url" {
  description = "URL of the DLQ"
  type        = string
  validation {
    condition     = length(var.queue_url) > 0
    error_message = "queue_url must not be empty."
  }
}

variable "redrive_permission" {
  description = "Permission type (allowAll, denyAll, byQueue)"
  type        = string
  default     = "byQueue"
  validation {
    condition     = contains(["allowAll", "denyAll", "byQueue"], var.redrive_permission)
    error_message = "redrive_permission must be allowAll, denyAll, or byQueue."
  }
}

variable "source_queue_arns" {
  description = "List of source queue ARNs allowed to use this DLQ"
  type        = list(string)
  default     = []
}
