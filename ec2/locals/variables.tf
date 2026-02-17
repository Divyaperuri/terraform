variable "project" {
    default = "roboshop"
}

variable "environment" {
    default = "dev"
}

# variable "common_name" {
#     default = "${var.project}-${var.environment}"
# }

variable "ami_id" {
    default     = "ami-0220d79f3f480ecf5"
}

variable "instance_type" {
    type = string #datatype
    default = "t3.micro"
}

variable "common_tags" {
    type = map 
    default = {
        Terraform = true
        Project = "roboshop"
        Environment = "dev"
    }
}

variable "sg_name" {
    type = string
    default = "allow-all"
    description = "Security group name to attach EC2 instance"
}

variable "cidr" {
    type = list 
    default = ["0.0.0.0/0"]
}

variable "engress_from_port" {
    default = 0
}

variable "engress_to_port" {
    default = 0
}

variable "ingress_from_port" {
    default = 0
}

variable "ingress_to_port" {
    default = 0
}    

variable "protocol" {
    type = string
    default = "-1"
}