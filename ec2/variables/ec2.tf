resource "aws_instance" "terraform" {
    ami= var.ami_id
    instance_type= var.instance_type
    vpc_security_group_ids = [aws_security_group.allow_all.id]
    tags = var.ec2_tags
}

resource "aws_security_group" "allow_all" {
    name = var.sg_name
    #outbound traffic
    egress {
        from_port   = var.engress_from_port # all ports are allow
        to_port     = var.engress_to_port  # all ports are allow
        protocol    = var.protocol # -1 means all protocols 
        cidr_blocks = var.cidr # internet allow
    }
    #inbound traffic
    ingress {
         from_port   = var.ingress_from_port # all ports are allow
        to_port     = var.ingress_to_port  # all ports are allow
        protocol    = var.protocol # -1 means all protocols 
        cidr_blocks = var.cidr # internet allow
    }
    tags = {
        Name = "allow-all"
    }
}