output "id" {
  value       = aws_cognito_user_pool.default.id
  description = "The ID of the AWS Cognito User Pool"
}

output "arn" {
  value       = aws_cognito_user_pool.default.arn
  description = "The ARN of the AWS Cognito User Pool"
}