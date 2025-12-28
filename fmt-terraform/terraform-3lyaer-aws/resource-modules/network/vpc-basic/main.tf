resource "aws_vpc" "this" {
  cidr_block           = var.cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = merge(
    var.tags,
    { Name = "${var.project}-${var.environment}-vpc" }
  )
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = merge(
    var.tags,
    { Name = "${var.project}-${var.environment}-igw" }
  )
}

resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.public_subnet_cidr
  availability_zone = var.az

  map_public_ip_on_launch = true

  tags = merge(
    var.tags,
    { Name = "${var.project}-${var.environment}-public-subnet" }
  )
}

resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.private_subnet_cidr
  availability_zone = var.az

  tags = merge(
    var.tags,
    { Name = "${var.project}-${var.environment}-private-subnet" }
  )
}

resource "aws_subnet" "database" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.database_subnet_cidr
  availability_zone = var.az

  tags = merge(
    var.tags,
    { Name = "${var.project}-${var.environment}-database-subnet" }
  )
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  tags = merge(
    var.tags,
    { Name = "${var.project}-${var.environment}-public-rt" }
  )
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}
