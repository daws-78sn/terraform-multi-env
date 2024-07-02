data "aws_ami" "ami_info" {
    most_recent = true
    owners = ["973714476881"] #get it from AWS
    filter {
        name = "name"
        values = ["RHEL-9-DevOps-Practice"] #get it from AWS
    }
    #you can add more filter like below
    filter {
        name = "virtualization-type"
        values = ["hvm"]
    }

    filter {
      name = "root-device-type"
      values = ["ebs"]
    }
}
#to get vpc of provider (ours is us-east-1)
data "aws_vpc" "default" {
    default = true
}