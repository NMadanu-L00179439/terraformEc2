resource "aws_route_table" "PublicRouteTable" {
  vpc_id = "${aws_vpc.mainvpc.id}"
  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = "${aws_internet_gateway.IGW_TF.id}"
  }
  tags = {
      Name = "PublicRouteTable"
  }
  depends_on = ["aws_vpc.mainvpc","aws_internet_gateway.IGW_TF"]
}


resource "aws_route_table_association" "publicroutetableassociation" {
  subnet_id      = "${aws_subnet.PublicSubnet_A.id}"
  route_table_id = "${aws_route_table.PublicRouteTable.id}"
  depends_on     = ["aws_subnet.PublicSubnet_A","aws_route_table.PublicRouteTable"]
}
