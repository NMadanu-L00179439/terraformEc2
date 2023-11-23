resource "aws_subnet" "PublicSubnet_A" {
  vpc_id     = "${aws_vpc.mainvpc.id}"
  cidr_block = "10.0.0.0/24"
  availability_zone = "eu-west-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "PublicSubnet_A"
  }
  depends_on = ["aws_vpc.mainvpc"]
}
