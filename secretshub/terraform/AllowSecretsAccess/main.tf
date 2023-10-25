provider "aws" {
  region = var.SecretsManagerRegion
}

resource "aws_iam_role" "allow_secrets_access_role" {
    
  name = "AllowSecretsAccessRole"
  force_detach_policies = true
  
  assume_role_policy = jsonencode({
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          AWS = "${var.CyberArkSecretsHubRoleARN}"
        }
        Action = [
          "sts:AssumeRole"
        ]
      }
    ]
  })
  
  inline_policy {
    name = "${var.Policy}"
  
    policy = jsonencode({
      Statement = [
        {
          Action   = ["secretsmanager:CreateSecret"]
          Effect   = "Allow"
          Resource = join(":", ["arn", "aws", "secretsmanager", "${var.SecretsManagerRegion}", "${var.SecretsManagerAccount}", "secret", "*"])
          Condition = {
            StringEquals = {
              "aws:RequestTag/Sourced by CyberArk" = [
                ""
              ]
            }
          }
        },
        {
          Action   = ["secretsmanager:ListSecrets"]
          Effect   = "Allow"
          Resource = "*"
          Condition = {
            StringEquals = {
              "aws:RequestedRegion" = "${var.SecretsManagerRegion}"
            }
          }
        },
        {
          Action   = [
                "secretsmanager:UpdateSecret",
                "secretsmanager:PutSecretValue",
                "secretsmanager:DeleteSecret",
                "secretsmanager:DescribeSecret",
                "secretsmanager:TagResource",
                "secretsmanager:UntagResource"
          ]
          Effect   = "Allow"
          Resource = join(":", ["arn", "aws", "secretsmanager", "${var.SecretsManagerRegion}", "${var.SecretsManagerAccount}", "secret", "*"])
          Condition = {
            StringEqualsIgnoreCase = {
              "aws:ResourceTag/Sourced by CyberArk" = ""
            }
          }
        },    
      ]
    })
  }
}