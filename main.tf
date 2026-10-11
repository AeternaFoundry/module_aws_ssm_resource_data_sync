resource "aws_ssm_resource_data_sync" "ssm_resource_data_syncs" {
  for_each = var.ssm_resource_data_syncs

  name   = each.value.name
  region = each.value.region

  s3_destination {
    bucket_name = each.value.s3_destination.bucket_name
    dynamic "destination_data_sharing" {
      for_each = each.value.s3_destination.destination_data_sharing != null ? [each.value.s3_destination.destination_data_sharing] : []
      content {
        destination_data_sharing_type = destination_data_sharing.value.destination_data_sharing_type
      }
    }
    kms_key_arn = each.value.s3_destination.kms_key_arn
    prefix      = each.value.s3_destination.prefix
    region      = each.value.s3_destination.region
    sync_format = each.value.s3_destination.sync_format
  }
}

