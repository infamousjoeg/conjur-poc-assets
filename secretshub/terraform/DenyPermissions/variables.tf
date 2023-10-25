variable Policy {
  description = "A meaningful name for the policy, for example, DenyPermissionsToUser. Do not use spaces in the policy name."
  type = string
}
  
variable UserRole {
  description = "The name of the role this policy will be added to, thereby denying users that are assigned to this role from updating secret managed by Secrets Hub."
  type = string
}
  
variable SecretsManagerAccount {
  description = "The AWS Secrets Manager's account ID."
  type = string
}
  
variable SecretsManagerRegion {
  description = "The AWS Secrets Manager's region."
  type = string
}