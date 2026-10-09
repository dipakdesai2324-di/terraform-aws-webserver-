
output "vpc_id" {
  description = "ID of the created VPC"
  value       = aws_vpc.main.id
}

output "ec2_instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.web.id
}

output "public_ip" {
  description = "Public IP of the web server"
  value       = aws_instance.web.public_ip
}

output "website_url" {
  description = "URL of the deployed web server"
  value       = "http://${aws_instance.web.public_ip}"
}
