data "aws_ami" "joindevops" {
    owners      = ["973714476881"]
    most_recent = true

    filter {
        name = "name"
        values = ["Redhat-9-DevOps-Practice"]
    }

    filter {
        name = "root-device-type"
        values = ["ebs"]
    }

    filter {
        name = "virtualization-type"
        values = ["hvm"]
    }
}

output "ami_id" {
    value = data.aws_ami.joindevops.id
}

# query the resources data from provider that are created manually
# data "aws_instance" "mongodb" {
#     instance_id = "i-02a7031ab805d1f8b"
# }

# output "mongodb_info" {
#     value = data.aws_instance.mongodb.public_ip
# }

# output "mongodb_private" {
#     value = data.aws_instance.mongodb.private_ip
# }

