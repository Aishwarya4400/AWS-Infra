
# Internet VPC
resource "aws_vpc" "main" {
  cidr_block       = "20.0.0.0/16"
  instance_tenancy = "default"
  #enable_dns_support   = "true"
  #enable_dns_hostnames = "true"
  #enable_classiclink   = "false"
  tags = {
    Name = "aishwarya-vpc"
  }
}

# Subnets
resource "aws_subnet" "main-public-1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "20.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "ap-southeast-2a"

  tags = {
    Name = "aishwarya-vpc-public"
  }
}



resource "aws_subnet" "main-private-1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "20.0.4.0/24"
  map_public_ip_on_launch = "false"
#  availability_zone       = 

  tags = {
    Name = "aishwarya-vpc-private"
  }
}



# Internet GW
resource "aws_internet_gateway" "main-gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "aishwarya-IG"
  }
}

# route tables
resource "aws_route_table" "main-public" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main-gw.id
  }

  tags = {
    Name = "aishwarya-public-RT"
  }
}

resource "aws_route_table" "main-private" {
  vpc_id = aws_vpc.main.id
  #route {
  #  cidr_block = "0.0.0.0/0"
  #   gateway_id = aws_internet_gateway.main-gw.id
  # }

  tags = {
    Name = "aishwarya-private-RT"
  }
}


resource "aws_route_table_association" "main-public-1" {
  subnet_id      = aws_subnet.main-public-1.id
  route_table_id = aws_route_table.main-public.id
}


resource "aws_route_table_association" "main-private-1" {
  subnet_id      = aws_subnet.main-private-1.id
  route_table_id = aws_route_table.main-private.id
}

