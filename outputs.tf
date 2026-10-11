output "ssm_resource_data_syncs_id" {
  description = "Map of id values across all ssm_resource_data_syncs, keyed the same as var.ssm_resource_data_syncs"
  value       = { for k, v in aws_ssm_resource_data_sync.ssm_resource_data_syncs : k => v.id if v.id != null && length(v.id) > 0 }
}
output "ssm_resource_data_syncs_name" {
  description = "Map of name values across all ssm_resource_data_syncs, keyed the same as var.ssm_resource_data_syncs"
  value       = { for k, v in aws_ssm_resource_data_sync.ssm_resource_data_syncs : k => v.name if v.name != null && length(v.name) > 0 }
}
output "ssm_resource_data_syncs_region" {
  description = "Map of region values across all ssm_resource_data_syncs, keyed the same as var.ssm_resource_data_syncs"
  value       = { for k, v in aws_ssm_resource_data_sync.ssm_resource_data_syncs : k => v.region if v.region != null && length(v.region) > 0 }
}
output "ssm_resource_data_syncs_s3_destination" {
  description = "Map of s3_destination values across all ssm_resource_data_syncs, keyed the same as var.ssm_resource_data_syncs"
  value       = { for k, v in aws_ssm_resource_data_sync.ssm_resource_data_syncs : k => one(v.s3_destination) if v.s3_destination != null && length(v.s3_destination) > 0 }
}

