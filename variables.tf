variable "ssm_resource_data_syncs" {
  description = <<EOT
Map of ssm_resource_data_syncs, attributes below
Required:
    - name
    - s3_destination (block):
        - bucket_name (required)
        - destination_data_sharing (optional, block):
            - destination_data_sharing_type (optional)
        - kms_key_arn (optional)
        - prefix (optional)
        - region (required)
        - sync_format (optional)
Optional:
    - region
EOT

  type = map(object({
    name   = string
    region = optional(string)
    s3_destination = object({
      bucket_name = string
      destination_data_sharing = optional(object({
        destination_data_sharing_type = optional(string)
      }))
      kms_key_arn = optional(string)
      prefix      = optional(string)
      region      = string
      sync_format = optional(string)
    })
  }))
  validation {
    condition = alltrue([
      for k, v in var.ssm_resource_data_syncs : (
        v.s3_destination.destination_data_sharing == null || (v.s3_destination.destination_data_sharing.destination_data_sharing_type == null || (contains(["Organization"], v.s3_destination.destination_data_sharing.destination_data_sharing_type)))
      )
    ])
    error_message = "must be one of: Organization"
  }
  # Note: 3 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

