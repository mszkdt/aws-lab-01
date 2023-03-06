
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.aws_vpc.id
}

resource "aws_route_table_association" "private_1a" {
  subnet_id      = aws_subnet.private_1a.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_1c" {
  subnet_id      = aws_subnet.private_1c.id
  route_table_id = aws_route_table.private.id
}

resource "aws_eip" "nat_gateway" {
  vpc        = true
  depends_on = [aws_internet_gateway.aws_internet_gateway]
}

resource "aws_nat_gateway" "aws_nat_gateway_1a" {
  allocation_id = aws_eip.nat_gateway.id
  subnet_id     = aws_subnet.public_1a.id
  depends_on    = [aws_internet_gateway.aws_internet_gateway]
}


