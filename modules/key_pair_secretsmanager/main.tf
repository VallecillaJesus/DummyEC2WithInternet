module "key_pair" {
  source   = "terraform-aws-modules/key-pair/aws"

  key_name = var.key_pair_name
  create_private_key = true
}


resource "aws_secretsmanager_secret" "this" {
  name = var.secretsmanager_name
  recovery_window_in_days = var.recovery_window_in_days
}


resource "aws_secretsmanager_secret_version" "this" {
  secret_id     = aws_secretsmanager_secret.this.id
  secret_string = module.key_pair.private_key_pem
}

