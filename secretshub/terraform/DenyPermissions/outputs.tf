output role_name_to_deny {
  description = "The name of the AWS role to assign the deny policy to"
  value       = var.UserRole
}  
 
output deny_policy_arn {
  description = "The ARN of the policy that denies access to the provided AWS Secrets Manager"
  value       = resource.aws_iam_policy.deny_asm_policy.arn
}