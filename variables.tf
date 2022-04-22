variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region" {}
variable "amis" {
    description = "AMIs by region"
    default = {
    us-east-1 = "ami-04505e74c0741db8d" #Ubuntu Server 20.04 LTS (HVM)
    us-east-2 = "ami-0fb653ca2d3203ac1" #Ubuntu Server 20.04 LTS (HVM)
    }
}
variable "imagename" {}
variable "vpc_cidr" {}
variable "vpc_name" {}
variable "IGW_name" {}
variable "key_name" {}
variable Main_Routing_Table {}
variable private_Routing_Table {}
variable "azs" {
    description = "Run the EC2 instances in these Availabulity Zones"
    type = list
    #default = ["us-east-1a","us-east-1b","us-east-1c","us-east-1d","us-east-1e","us-east-1f" ]
}

variable "public_cidr" {
    description = "CIDR Blocks for Public subnets"
    type = list
    #default = ["10.1.1.0/24","10.1.2.0/24","10.1.3.0/24" ]
}

variable "private_cidr" {
    description = "CIDR Blocks for Private subnets"
    type = list
    #default = ["10.1.10.0/24","10.1.20.0/24","10.1.30.0/24" ]
}
variable "env" {}
variable "insatnce_type"{
    type = map
    default = {
        dev = "t2.nano"
        test = "t2.micro"
        prod = "t2.medium"
    }
}