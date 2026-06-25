// crreate an ec2 and link it with securoty group 
resource "aws_instance" "jenkins_instance" {
  ami           = var.ami
  instance_type = "t3.small"
  key_name      = aws_key_pair.UbuntuKP.key_name
  security_groups = [aws_security_group.jenkins_security_group.name]

  tags = {
    Name = "JenkinsInstance"
  }
}