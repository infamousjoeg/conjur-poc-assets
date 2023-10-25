provider "aws" {
  region = var.SecretsManagerRegion  
}

resource "aws_iam_policy" "deny_asm_policy" {
  name        = var.Policy
  description = "A policy to deny users from updating secrets from a specifics AWS Secrets Manager that are managed by Secrets Hub"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
        {
            Effect =  "Deny",
            Action = [  
                      "secretsmanager:UpdateSecret",
                      "secretsmanager:PutSecretValue",
                      "secretsmanager:DeleteSecret"
            ],
            Resource = join(":", ["arn", "aws", "secretsmanager", var.SecretsManagerRegion, var.SecretsManagerAccount, "secret", "*"]),
            Condition = {
                StringEquals = {
                    "aws:ResourceTag/Sourced by CyberArk": ""
                }
            }
        },
        {
            Effect = "Deny",
            Action = "secretsmanager:TagResource",
            Resource = join(":", ["arn", "aws", "secretsmanager", var.SecretsManagerRegion, var.SecretsManagerAccount, "secret", "*"]),
            Condition = {
                "ForAllValues:StringLike" = {
                    "aws:TagKeys" = [
                                    "CyberArk*",
                                    "cyberark*",
                                    "Cyberark*",
                                    "cyberArk*",
                                    "CYBERARK*"
                    ]
                }
            }
        },
        {
            Effect = "Deny",
            Action = "secretsmanager:UntagResource",
            Resource = join(":", ["arn", "aws", "secretsmanager", var.SecretsManagerRegion, var.SecretsManagerAccount, "secret", "*"]),
            Condition = {
                "ForAllValues:StringLike" = {
                    "aws:TagKeys" = [
                                    "CyberArk*",
                                    "cyberark*",
                                    "Cyberark*",
                                    "cyberArk*",
                                    "CYBERARK*",
                                    "Sourced by CyberArk"
                    ]
                }
            }
        },    
      ]
  })
}

resource "aws_iam_role_policy_attachment" "attach_deny_policy_to_role" {
  role       = var.UserRole
  policy_arn = resource.aws_iam_policy.deny_asm_policy.arn
}