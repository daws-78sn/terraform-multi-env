resource "aws_instance" "expense" {
    ami = "ami-041e2ea9402c46c32"
    vpc_security_group_ids = ["sg-0909fab5362d64cd9"]
    instance_type = lookup(var.instance_type, terraform.workspace)
}