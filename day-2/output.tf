output "public" {
  value = aws_instance.shu.public_ip
}
output "private" {
  value = aws_instance.shu.private_ip
}