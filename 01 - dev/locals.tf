locals {
  resource_prefix = "frame-flow-dev"
  aws_region      = "us-east-1"

  default_tags = {
    Env       = "Dev"
    Terraform = "True"
  }
  product_tags = merge(local.default_tags, {
    product = "app"
  })

  deletion_protection=false

  rds = {
    devdb = {
      engine                          = "aurora-postgresql"
      engine_version                  = "16.1"
      subnet_ids                      = [data.aws_subnet.db_us_east_1a.id, data.aws_subnet.db_us_east_1b.id]
      vpc_security_group_ids          = [module.app-productstack.productstack-sg-ids["storage-default-rds"].id]
      username                        = "cw_master"
      instance_class                  = "db.t4g.medium"
      storage_type                    = "aurora-iopt1"
      skip_final_snapshot             = true
      database_name                   = "cw_master"
      backup_retention_period         = 7
      deletion_protection             = true
      availability_zones              = ["us-east-1c"]
      instances_count                 = 2
      kms_key_id                      = data.aws_kms_key.default.key_id
      performance_insights_enabled    = true
      performance_insights_kms_key_id = data.aws_kms_key.default.key_id
    }
  }
}