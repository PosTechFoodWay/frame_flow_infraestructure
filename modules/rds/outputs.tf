output "instance_public_ip" {
  value =  aws_secretsmanager_secret.default.arn                                         # The actual value to be outputted
  description = "The public IP address of the EC2 instance" # Description of what this output represents
}