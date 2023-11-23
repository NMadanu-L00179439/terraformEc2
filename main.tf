provider "aws" {
    region = "eu-west-1"  
}

resource "aws_instance" "foo" {
  ami           = "ami-005e7be1c849abba7" # us-west-2
  instance_type = "t2.micro"
  key_name = "ec2creationkey"
  tags = {
      Name = "public-Ec2-Instance"
  }
}
