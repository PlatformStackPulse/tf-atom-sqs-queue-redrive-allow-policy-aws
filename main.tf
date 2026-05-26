resource "aws_sqs_queue_redrive_allow_policy" "this" {
  count = module.this.enabled ? 1 : 0

  queue_url = var.queue_url

  redrive_allow_policy = jsonencode({
    redrivePermission = var.redrive_permission
    sourceQueueArns   = var.source_queue_arns
  })
}
