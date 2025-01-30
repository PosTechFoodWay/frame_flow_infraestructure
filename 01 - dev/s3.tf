module "videos-bucket" {
  source = "../modules/bucket"
  providers = {
    aws = aws.dev-workload-1
  }

  force_destroy = !local.deletion_protection

  resource_prefix  = local.resource_prefix
  additional_tags  = local.product_tags
  component_prefix = "videos"
}

# TODO: Adicionar Logs e middleware para salvar logs 
# module "logs-bucket" {
#   source = "../modules/bucket"
#   providers = {
#     aws = aws.dev-workload-1
#   }
# 
#   force_destroy = !local.deletion_protection
# 
#   resource_prefix  = local.resource_prefix
#   additional_tags  = local.product_tags
#   component_prefix = "logs"
# }