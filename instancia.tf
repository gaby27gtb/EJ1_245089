resource "aws_instance" "instancia_ac_245089" {
    ami                 = var.ami
    instance_type       = var.instance_type
    key_name            = var.key_name
    vpc_security_group_ids = [aws_security_group.allow-ssh.id]
    subnet_id = aws_subnet.vpc-subnet-us-east-1a.id
    tags = {
        Name        = "instancia_ac_245089"
        terraform   = "True"
    }
}