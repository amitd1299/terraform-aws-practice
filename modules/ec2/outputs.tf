output "ec2_public_ip" {
  value = aws_instance.myserver.public_ip
}

output "ec2_id" {
  value = aws_instance.myserver.id
}