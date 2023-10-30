output allow_secrets_access_role_arn {
  description = "The ARN of the role that allows CyberArk Secrets Hub to manage secrets in the provided AWS Secrets Manager"
  value       = resource.aws_iam_role.allow_secrets_access_role.arn
}
 
output allow_secrets_access_role_name {
  description = "The name of the role that allows CyberArk Secrets Hub to manage secrets in the provided AWS Secrets Manager"
  value       = resource.aws_iam_role.allow_secrets_access_role.name
}