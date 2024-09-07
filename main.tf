module "bucket" {
  source         = "./modules/bucket"
  aws_account_id = data.aws_caller_identity.current.account_id
  aws_region     = data.aws_region.current.name
  roles_assumable_by_arns = [
    "arn:aws:iam::667990009:root",
    "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root",
  ]
  source_repo         = var.source_repo
  system              = var.system
  team                = var.team
  account_id_identity = var.account_id_identity
  account_number      = var.account_number
  account_id_dev      = var.account_id_dev
  account_id_stg      = var.account_id_stg
  account_id_prd      = var.account_id_prd
  env                 = var.env
  tags                = var.tags
}
