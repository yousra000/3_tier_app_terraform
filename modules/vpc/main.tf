resource "aws_vpc" "vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

}

resource "aws_subnet" "pub_sub" {
  count = 2
  vpc_id     = aws_vpc.vpc.id
  cidr_block = cidrsubnet(aws_vpc.vpc.cidr_block, 8, count.index )
  availability_zone       = element(["us-east-1a","us-east-1b"], count.index)
  map_public_ip_on_launch = true

}

resource "aws_subnet" "priv_sub" {
  count = 2
  vpc_id     = aws_vpc.vpc.id
  cidr_block = cidrsubnet(aws_vpc.vpc.cidr_block, 8, count.index + 2)
  availability_zone       = element(["us-east-1a","us-east-1b"], count.index)
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc.id

}

resource "aws_route_table" "pub_route_table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }


}

resource "aws_route_table_association" "soc_gw_route_table" {
  count          = 2
  subnet_id      = aws_subnet.pub_sub[count.index].id
  route_table_id = aws_route_table.pub_route_table.id
}


resource "aws_route_table" "priv_route_table" {
  vpc_id = aws_vpc.vpc.id

}
resource "aws_route_table_association" "priv_route_assoc" {
  count          = 2
  subnet_id      = aws_subnet.priv_sub[count.index].id
  route_table_id = aws_route_table.priv_route_table.id
}