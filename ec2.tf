resource "aws_instance" "PublicEC2" {
  ami =   "ami-005e7be1c849abba7"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.allow_ssh.id}"]
  user_data = <<EOF
sudo yum update -y
sudo amazon-linux-extras install docker
sudo service docker start
sudo usermod -a -G docker ec2-user
mkdir datadocker
cd datadocker/

EOF
  subnet_id = "${aws_subnet.PublicSubnet_A.id}"
  key_name = "ec2creationkey"
  tags = {
    Name = "PublicEC2"
  }
  depends_on = ["aws_vpc.mainvpc","aws_subnet.PublicSubnet_A","aws_security_group.allow_ssh"]
}
