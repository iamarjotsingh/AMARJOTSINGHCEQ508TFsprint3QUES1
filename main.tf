
# MY VPC

resource "aws_vpc" "amar_vpc" {
  cidr_block       = "192.168.0.0/16"
  instance_tenancy = "default"


  tags = {
    Name = "Amarjot Singh"
    Owner = "amarjot.singh@cloudeq.com"
    Purpose = "training"
  }
}


# SUBNET 1

resource "aws_subnet" "amar_subnet1" {
  vpc_id     = "${aws_vpc.amar_vpc.id}"
  cidr_block = "192.168.1.0/24"
  availability_zone = "ap-south-1a"

  tags = {
    Name = "Amarjot Singh"
    Owner = "amarjot.singh@cloudeq.com"
    Purpose = "training"
  }
}


# SUBNET 2


resource "aws_subnet" "amar_subnet2" {
  vpc_id     = "${aws_vpc.amar_vpc.id}"
  cidr_block = "192.168.2.0/24"
  availability_zone = "ap-south-1b"

  tags = {
    Name = "Amarjot Singh"
    Owner = "amarjot.singh@cloudeq.com"
    Purpose = "training"
  }
}

# 2 EC2's IN SUBNET 1

resource "aws_instance" "amar1_EC2" {

  count = 2
  ami                     = "ami-0f8ca728008ff5af4"
  instance_type           = "t2.micro"


  vpc_security_group_ids = ["${aws_security_group.amar_secgroup.id}"]
  

  subnet_id = "${aws_subnet.amar_subnet1.id}"

  tags = {
    Name = "Amarjot Singh"
    Owner = "amarjot.singh@cloudeq.com"
    Purpose = "training"
  }

  volume_tags = {
    Name = "Amarjot Singh"
    Owner = "amarjot.singh@cloudeq.com"
    Purpose = "training"
  }


}


# 2 EC2's IN SUBNET 2


resource "aws_instance" "amar2_EC2" {

  count = 2
  ami                     = "ami-0f8ca728008ff5af4"
  instance_type           = "t2.micro"


  vpc_security_group_ids = ["${aws_security_group.amar_secgroup.id}"]
 

  subnet_id = "${aws_subnet.amar_subnet2.id}"

  tags = {
    Name = "Amarjot Singh"
    Owner = "amarjot.singh@cloudeq.com"
    Purpose = "training"
  }

  volume_tags = {
    Name = "Amarjot Singh"
    Owner = "amarjot.singh@cloudeq.com"
    Purpose = "training"
  }

}


# SECURITY GROUP

resource "aws_security_group" "amar_secgroup" {
  name        = "Amarjot Singh"
  description = "Allow HTTP AND HTTPS traffic"
  vpc_id      = "${aws_vpc.amar_vpc.id}"

  ingress {
    description      = "HTTP from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "HTTPS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    description      = "VPC TO HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    description      = "VPC TO HTTPS"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  

  tags = {
    Name = "Amarjot Singh"
    Owner = "amarjot.singh@cloudeq.com"
    Purpose = "training"
  }
}