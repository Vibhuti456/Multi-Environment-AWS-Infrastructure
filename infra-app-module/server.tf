#key_pair
resource "aws_key_pair" "deployer"{
    key_name = "${var.env}-infra-app-key"
    public_key = file("terra-key-ec2.pub")

    tags = {
        Name = "${var.env}-infra-app-key"
        Environment = var.env
    }

}

#vpc and security groups
resource "aws_default_vpc" "default"{

} 

#security groups
resource "aws_security_group" "mysg"{
    name = "${var.env}-infra-app-sg"
    description = "this will add a TF generated security group"
    vpc_id = aws_default_vpc.default.id     #interpolation

    #inbound rules
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "SSH Open"
    }
    ingress {
         from_port = 80
         to_port = 80
         protocol = "tcp"
         cidr_blocks = ["0.0.0.0/0"]
         description = "HTTP Open"
    }
    #outbound rules
    egress {
       from_port = 0
       to_port = 0
       protocol = "-1"
       cidr_blocks = ["0.0.0.0/0"]
       description = "All Access"
    }

    tags = {
      name = "${var.env}-infra-app-sg"
      Environment = var.env
    }
}

#ec2 instance
resource "aws_instance" "ec2_instance" {
#   Meta Arguments
    count = var.instance_count

#   Meta Arguments
    depends_on = [ aws_key_pair.deployer, aws_security_group.mysg ]

    key_name = aws_key_pair.deployer.key_name
    security_groups = [aws_security_group.mysg.name]
    instance_type = var.instance_type              
    ami = var.ami_id            

    root_block_device {
      volume_size = var.env == "prd" ? 20 : 10    # ---> conditional expr
      volume_type = "gp3"
    }
  
    tags = {
      Name = "${var.env}-infra-app-instance"                   
      Environment = var.env
    }
}
