# VPC

resource "aws_vpc" "testvpc" {
  cidr_block                       = "$var.vpc_cidr_block"
  assign_generated_ipv6_cidr_block = true
  enable_dns_hostnames             = true

  tags {
    Name           = "$var.organization"
    organization   = "$var.organization"
  }
}

# Internet Egress
resource "aws_internet_gateway" "public" {
  vpc_id = "$aws_vpc.testvpc.id"

  tags {
    organization = "$var.organization"
  }
}

