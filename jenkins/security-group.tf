# Security Group
variable "ingress_ports" {
  type    = list(number)
  default = [8080, 22]
}

resource "aws_security_group" "jenkins-sg" {
  name        = "Allow web traffic"
  description = "Inbound ports for ssh and standard http and everything outbound"
  dynamic "ingress" {
    for_each = var.ingress_ports
    content {
      protocol    = "tcp"
      from_port   = ingress.value
      to_port     = ingress.value
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name"      = "Jenkins-sg"
    "Terraform" = "true"
  }
}

