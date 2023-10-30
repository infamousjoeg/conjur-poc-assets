variable Policy {
  description = "A meaningful name for the policy. Do not use spaces in the policy name"
  type = string
}
  
variable CyberArkSecretsHubRoleARN {
  description = "The Secrets Hub Role ARN created for your CyberArk tenant. You can access this value from the Settings page in UI or via /api/info API"
  type = string
}
  
variable SecretsManagerAccount {
  description = "The AWS Secrets Manager's account ID"
  type = string
}
  
variable SecretsManagerRegion {
  description = "The AWS Secrets Manager's region"
  type = string
}