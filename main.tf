import {
  to = aws_default_subnet.subnet-tera-1
  id = "subnet-02adf99d851947ee6"
}

provider "aws" {
  region     = "eu-west-1"
}

resource "aws_security_group" "aws_sg" {
  name = "security group from terraform"

  ingress {
    description = "SSH from the internet"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "80 from the internet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}


resource "aws_instance" "aws_ins_web" {

  ami                         = "ami-005e7be1c849abba7"
  instance_type               = "t2.micro"
  vpc_security_group_ids      = [aws_security_group.aws_sg.id]
  associate_public_ip_address = true
  subnet_id = "${aws_default_subnet.subnet-tera-1.id}"
  key_name                    = "ec2creationkey" # your key here

  tags = {
    Name = "public-tera-ec2"
  }

}

output "instance_ip" {
  value = aws_instance.aws_ins_web.public_ip
}

