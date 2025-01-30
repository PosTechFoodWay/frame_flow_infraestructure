module "rds_cluster" {
  source = "../modules/rds",
  providers = {
    aws = aws.dev-workload-1
  }
  for_each = local.rds

  resource_prefix  = local.resource_prefix
  additional_tags  = local.product_tags
  component_prefix = each.key

  instance_class                  = each.value.instance_class
  engine                          = each.value.engine
  engine_version                  = each.value.engine_version
  username                        = each.value.username
  password                        = "@Strong!Password0325"
  vpc_security_group_ids          = each.value.vpc_security_group_ids
  skip_final_snapshot             = each.value.skip_final_snapshot
  subnet_ids                      = each.value.subnet_ids
  db_name                         = each.value.database_name
  performance_insights_enabled    = each.value.performance_insights_enabled
  performance_insights_kms_key_id = each.value.performance_insights_kms_key_id
  allocated_storage               = 64
}