output "key_pair_id" {
    description = "The id of the key pair"
    value = module.key_pair.key_pair_id
}


output "secretsmanager_id" {
    description = "The id of the secrets manager"
    value = aws_secretsmanager_secret.this.id
}


output "key_pair_name" {
    description = "The module key pair name"
    value = module.key_pair.key_pair_name
}