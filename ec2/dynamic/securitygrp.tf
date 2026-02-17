resource "aws_security_group" "roboshop_instance" {
    name = "roboshop_securiy_grp"
    #outbound traffic
    # egress block
    egress {
        from_port   = 0 
        to_port     = 0  
        protocol    = "-1" 
        cidr_blocks = ["0.0.0.0/0"] 
    }
    #inbound traffic while giving every port individual lines may increase
    # ingress block
    dynamic "ingress" {
        for_each   = toset(var.ingress_ports)
        content{
            from_port   = ingress.value #will get the port num
            to_port     = ingress.value 
            protocol    = "tcp"  
            cidr_blocks = ["0.0.0.0/0"] 
        }
    }
    #   ingress {
    #      from_port   = 3306 # all ports are allow
    #     to_port     = 3306  # all ports are allow
    #     protocol    = "-1" # -1 means all protocols 
    #     cidr_blocks = ["0.0.0.0/0"] # internet allow
    # }
    #   ingress {
    #      from_port   = 8080 # all ports are allow
    #     to_port     = 8080  # all ports are allow
    #     protocol    = "-1" # -1 means all protocols 
    #     cidr_blocks = ["0.0.0.0/0"] # internet allow
    # }
    tags = {
        Name = "allow-all"
    }
}