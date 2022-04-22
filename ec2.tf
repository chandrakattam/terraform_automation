resource "aws_instance" "web-1" {
    count = "${var.env == "dev" ? 1 : 3}"
    ami = "${lookup(var.amis, var.aws_region)}"
    instance_type = "t2.nano"
    key_name = "AWSB12-keypair"
    subnet_id = "${element(aws_subnet.public_subnets.*.id, count.index)}"
    vpc_security_group_ids = ["${aws_security_group.allow_all.id}"]
    associate_public_ip_address = true
    tags = {
        Name = "${var.vpc_name}-Public-Server-${count.index+1}"
    }

    user_data = <<-EOF
		#!/bin/bash
        sudo apt-get update
		sudo apt-get install -y nginx
		sudo service nginx start
		echo "<h1>Deployed via Terraform-Public-Server-${count.index+1}</h1>" | sudo tee /var/www/html/index.nginx-debain.html
	EOF
}