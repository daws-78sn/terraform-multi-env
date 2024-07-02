resource "aws_instance" "expense" {
    for_each = var.instance_names #each.key and each.value
    ami           = data.aws_ami.ami_info.id #"ami-041e2ea9402c46c32"
    instance_type = each.value
    vpc_security_group_ids = ["sg-0909fab5362d64cd9"]
    tags = merge(
        var.common_tags,
        { Name = "${each.key}"
          Module = "${each.key}"
          Environment = var.environment
        }
    )
  
}