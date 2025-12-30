output "pub" {
  value = aws_instance.shu.public_ip
}
output "pvt" {
  value = aws_instance.shu.private_ip
}