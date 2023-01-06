output "vpc_id" {
  description = "The id of the vpc"
  value       = aws_vpc.this.id
}


output "subnet_id" {
  description = "The id of the subnet "
  value       = aws_subnet.public.id
}


output "route_table_id" {
  description = "The id of the route table"
  value       = aws_route_table.this.id
}


# output "key_pair_id" {
#     description = "The id of the key pair"
#   value    = module.key_pair.key_pair_id 
# }


# output "key_pair_name" {
#     description = "The name of the key pair"
#   value    = module.key_pair.key_pair_id 
# }