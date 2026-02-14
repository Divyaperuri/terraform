resource "aws_instance" "instance" {
    ami= "ami-0220d79f3f480ecf5"
    instance_type= "t3.micro"
    vpc_security_group_ids = [aws_security_group.allow_all.id]
    tags = {
        Name = "terraform"
        Terraform = "true"
    }
}

resource "aws_security_group" "allow_all-traffic" {
    name = "allow-all-traffic"
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
        Name = "allow-all-traffic"
    }
}