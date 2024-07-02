resource "aws_instance" "db" {
    ami = "ami-041e2ea9402c46c32"
    vpc_security_group_ids = ["sg-0909fab5362d64cd9"]
    instance_type = "t3.micro"

    # provisioners will run when you are creating resources
    # provisioners are used to configure resources
    # they will not run once the resources are created
    provisioner "local-exec" {
        command = "echo ${self.private_ip} > private.ips.txt"
        #ip address will be stored in text file
        #self is aws_instance.web
    }

    provisioner "local-exec" {
        command = "ansible-playbook -i private_ips.txt web.yaml"
    }

    connection {
      type = "ssh"
      user = "ec3-user"
      password = "DevOps321"
      host = self.public_ip   
    }

    provisioner "remote-exec" {
        inline = [
            "sudo dnf install ansible -y"
            "sudo dnf install nginx -y"
            "sudo systemctl start nginx"
        ]
    }

}