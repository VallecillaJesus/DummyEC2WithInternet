variable "environment_name" {
  type = string

  // EC2 instance tag name is excluded 
  description = "The name used to tag all resources"
  default     = "dummy_environment"
}

variable "ec2_name" {
  type        = string
  description = "The name of the ec2 instance"
  default     = "dummy_instance"
}


variable "ec2_ami" {
  type = string
  description = "The ami of the ec2 instance"
  default = "ami-0533f2ba8a1995cf9"
}


variable "ec2_instance_type" {
  type = string
  description = "The type of the ec2 instance"
  default = "t2.micro"
}


variable "key_pair_name" {
  type = string
  description = "The key pair name of the ec2 instance"
  default = "dummy_key"
}

