resource "aws_instance" "terraform" {
    count = 3
    ami= "var.zone_id"
    instance_type= "t3.micro"
    vpc_security_group_ids = [aws_security_group.allow_all.id]
    tags = {
        Name = "var.instances[count.index]"
        Terraform = "true"
    }
}

resource "aws_security_group" "allow_all" {
    name = "allow-al"
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
        Name = "allow-all"
    }
}