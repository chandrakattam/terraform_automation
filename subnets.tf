resource "aws_subnet" "public_subnets" {
    count = "${length(var.public_cidr)}"
    vpc_id = "${aws_vpc.default.id}"
    availability_zone = "${element(var.azs,count.index)}" #(Expression)
    cidr_block = "${element(var.public_cidr,count.index)}"
    

    tags = {
        Name = "${var.vpc_name}-Public-subnet-${count.index+1}"
    }
  
}

resource "aws_subnet" "private_subnets" {
    count = "${length(var.private_cidr)}"
    vpc_id = "${aws_vpc.default.id}"
    availability_zone = "${element(var.azs,count.index)}" #(Expression)
    cidr_block = "${element(var.private_cidr,count.index)}"
    

    tags = {
        Name = "${var.vpc_name}-private-subnet-${count.index+1}"
    }
  
}