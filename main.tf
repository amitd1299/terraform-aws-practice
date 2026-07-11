# VPC
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "${var.project_name}-vpc"
  }
}

# Subnet
resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_cidr

  tags = {
    Name = "${var.project_name}-subnet"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.project_name}-igw"
  }
}

# EC2 Instance
resource "aws_instance" "myserver" {
  ami           = "ami-0f58b397bc5c1f2e8"
  instance_type = var.instance_type
  subnet_id     = aws_subnet.main.id

  tags = {
    Name = "${var.project_name}-server"
  }
}