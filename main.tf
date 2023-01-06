resource "aws_vpc" "this" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = var.environment_name
  }
}


resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = var.environment_name
  }
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = var.environment_name
  }
}



# Grant internet access through internet gateway
resource "aws_route_table" "this" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  route {
    ipv6_cidr_block = "::/0"
    gateway_id      = aws_internet_gateway.this.id
  }

  tags = {
    Name = var.environment_name
  }
}


resource "aws_route_table_association" "this" {
  subnet_id     = aws_subnet.public.id
  route_table_id = aws_route_table.this.id
}


resource "aws_security_group" "this" {
  name   = "Allow SSH"
  vpc_id = aws_vpc.this.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}


module "key_pair_secretsmanager" {
  source = "./modules/key_pair_secretsmanager" 

  key_pair_name  = var.key_pair_name
  secretsmanager_name = var.environment_name
}


resource "aws_instance" "this" {
  ami           = var.ec2_ami
  instance_type = var.ec2_instance_type 
  key_name      = module.key_pair_secretsmanager.key_pair_name

  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.this.id]
  associate_public_ip_address = true

  tags = {
    Name : var.ec2_name
  }

}


