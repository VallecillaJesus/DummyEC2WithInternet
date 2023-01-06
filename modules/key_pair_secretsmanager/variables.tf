variable "secretsmanager_name" {
    type = string
    description = "The name of the secrets manager"
}


variable "key_pair_name" {
    type = string
    description = "The name of the key pair"
}


variable "recovery_window_in_days" {
    type = number
    description = "The name of the key pair"
    default = 0
}

