resource "aws_db_subnet_group" "default" {
  name       = "${local.prefix}-subnet-group"
  subnet_ids = var.subnet_ids

  tags = merge(var.additional_tags, {
    Name = "${local.prefix}-subnet-group"
  })
}

resource "aws_db_instance" "default" {
  identifier                      = "${local.prefix}-rds"
  instance_class                  = var.instance_class
  allocated_storage               = var.allocated_storage
  engine                          = var.engine
  engine_version                  = var.engine_version
  username                        = var.username
  password                        = var.password
  db_subnet_group_name            = aws_db_subnet_group.default.name
  vpc_security_group_ids          = var.vpc_security_group_ids
  skip_final_snapshot             = var.skip_final_snapshot
  db_name                         = var.db_name
  parameter_group_name            = aws_db_parameter_group.pgGroup.name
  performance_insights_enabled    = var.performance_insights_enabled
  performance_insights_kms_key_id = var.performance_insights_kms_key_id

  tags = merge(var.additional_tags, {
    Name = "${local.prefix}-rds-cluster"
  })
}


resource "aws_db_parameter_group" "pgGroup" {
  name        = "${local.prefix}-parameter-group"
  family      = "${var.engine}${var.engine_version}"
  description = "Custom parameter group"

  parameter {
    name         = "rds.force_ssl"
    value        = "0"
    apply_method = "pending-reboot"
  }
}

resource "aws_secretsmanager_secret" "default" {
  name = "${local.prefix}-secret-${local.timestamp_sanitized}"

  lifecycle {
    ignore_changes = [
      name
    ]
  }
}

resource "aws_secretsmanager_secret_version" "default" {
  secret_id = aws_secretsmanager_secret.default.id
  secret_string = jsonencode({
    username             = var.username
    dbInstanceIdentifier = aws_db_instance.default.identifier
    password             = var.password
    port                 = 5432
    host                 = aws_db_instance.default.endpoint
    engine               = "postgres"
  })
}