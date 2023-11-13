data "aws_ami" "amazon-linux-2" {
  most_recent = true

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }

  owners = ["amazon"]

}

resource "aws_instance" "jenkins" {
  ami             = data.aws_ami.amazon-linux-2.id
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.jenkins-sg.name]
  key_name        = "us-east-1-jenkins"
  provisioner "remote-exec" {
    inline = [
      "sudo amazon-linux-extras install epel -y",
      "sudo yum update -y",
      "sudo yum install java-11-amazon-corretto -y",
      "sudo yum remove java-1.8.0-openjdk -y",
      "sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo",
      "sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key",
      "sudo yum install jenkins -y",
      "sudo systemctl enable jenkins",
      "sudo systemctl start jenkins",
      "sudo chkconfig --add jenkins",
    ]
  }
  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ec2-user"
    private_key = "${file("/Users/laxmigangadharan/.ssh/us-east-1-jenkins.pem")}"
  }
  tags = {
    "Name" = "Jenkins"
  }

 // Add a block for the root block device
  root_block_device {
    volume_type = "gp2"
    volume_size = 8 # Replace with your desired root volume size
  }

  lifecycle {
   create_before_destroy = true
  }
}

resource "aws_ebs_volume" "jenkins_volume" {
  size              = 8
  type              = "gp2"
  availability_zone = aws_instance.jenkins.availability_zone
}

/*
resource "aws_volume_attachment" "jenkins_volume" {
  device_name = "/dev/xvdf"
  volume_id = "vol-01903525f09a927e6"
  instance_id = aws_instance.jenkins.id
}
*/
