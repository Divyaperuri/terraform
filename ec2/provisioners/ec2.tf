resource "aws_instance" "terraform" {
    ami= "ami-0220d79f3f480ecf5"
    instance_type= "t3.micro"
    vpc_security_group_ids = [aws_security_group.allow_all_ports.id]
    tags = {
        Name = "terraform"
        Terraform = "true"
    }

    provisioner "local-exec"{
        command = "echo ${self.private_ip} > inventory"
        on_failure = continue
    }

    provisioner "local-exec"{
        command = "echo instance destroyed"
        when     = destroy
    }
    connection {
        type        = "ssh"
        user        = "ec2-user"
        password    = "DevOps321"
        host        = self.public_ip
    }

    provisioner "remote-exec" {
        inline = [
            "sudo dnf install nginx -y",
            "sudo systemctl start nginx"
        ]
    }

    provisioner "remote-exec" {
        inline = [
            "sudo systemctl stop nginx",
            "echo 'Server destroyed successfully' "
        ]
        when = destroy
    }
}

resource "aws_security_group" "allow_all_ports" {
    name = "allow-all-ports"
    #outbound traffic
    egress {
        from_port   = 0 # all ports are allow
        to_port     = 0  # all ports are allow
        protocol    = "-1" # -1 means all protocols 
        cidr_blocks = ["0.0.0.0/0"] # internet allow
    }
    #inbound traffic
    ingress {
         from_port   = 0 # all ports are allow
        to_port     = 0  # all ports are allow
        protocol    = "-1" # -1 means all protocols 
        cidr_blocks = ["0.0.0.0/0"] # internet allow
    }
    tags = {
        Name = "allow-all-ports"
    }
}