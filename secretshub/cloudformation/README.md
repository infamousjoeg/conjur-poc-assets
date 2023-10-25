# cloudformation

## Usage

### AllowSecretsAccess.json

This policy defines a stack template for setting up AWS to work with Secrets Hub.

The policy grants the following permissions, restricted only to secrets that contain Sourced by CyberArk tag key:

|Permission|Description|
|----------|-----------|
|**secretsmanager:CreateSecret**|Grants permission to create a secret that stores encrypted data that can be queried and rotated. The secret contains the **Sourced by CyberArk** tag.|
|**secretsmanager:DeleteSecret**|Grants permission to delete a secret that is tagged **Sourced by CyberArk**.|
|**secretsmanager:UpdateSecret**|Grants permission to update a secret that is tagged **Sourced by CyberArk** with new metadata or with a new version of the encrypted data.|
|**secretsmanager:PutSecretValue**|For secrets that are tagged **Sourced by CyberArk**, grants permission to create a new version of the secret with new encrypted data.|
|**secretsmanager:ListSecrets**|Grants permission to list available secrets.|
|**secretsmanager:TagResource**|Grants permission to add tags to a secret that is tagged **Sourced by CyberArk**.|
|**secretsmanager:UntagResource**|Grants permission to remove tags from a secret that is tagged **Sourced by CyberArk**.|

1. Save the file as a JSON file, for example `AllowSecretsAccess.json`.
2. In the AWS account, create a CloudFormation stack using the JSON file you just created. For instructions on creating stacks, see the [CloudFormation documentation](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-cli-creating-stack.html).

Use the following guidelines to create the stack for Secrets Hub:

  1. Use **Template is ready** and **Upload** to upload your JSON file.
  2. When prompted, provide values for the following parameters:
|Parameter|Description|
|---------|-----------|
|`CyberArkSecretsHubRoleARN`|The Secrets Hub Role ARN created for your CyberArk tenant. You can access this value from the Settings page in Secrets Hub.|
|`Policy`|A meaningful name for the policy. Do not use spaces in the policy name. For example: **SecretsHubPermissions**|
|`SecretsManagerAccount`|The AWS Secrets Manager's account ID.|
|`SecretsManagerRegion`|The region of the AWS Secrets Manager.|
  3. **Optional:** Secrets Hub does not require any additional options, but you can configure these if you need them.

When the stack finishes running, an IAM role is created. Note the role's name (see the stack's **Resources** tab > **Physical ID**). This is the IAM role for Secrets Hub (Secrets Hub IAM role), and is required when creating a target secret store in Secrets Hub.

### DenyPermissions.json

After grant Secrets Hub permissions to sync your secrets, as described in Define "allow" role for Secrets Hub, we recommend that you apply a deny policy to all the other AWS roles that exist in your account.

Applying deny policies on roles other than the Secrets Hub role enforces least-privilege and ensures that AWS users don't perform actions that may interfere with Secrets Hub functionality and the integrity of the sync process.

This definition **denies** the following permissions on the AWS account:

|Permission|Description|
|----------|-----------|
|**secretsmanager:DeleteSecret**|Denies the AWS user permission to delete a secret tagged Sourced by CyberArk.|
|**secretsmanager:UpdateSecret**|Denies the AWS user permission to update a secret tagged Sourced by CyberArk with new metadata or with a new version of the encrypted data.|
|**secretsmanager:PutSecretValue**|For a secret tagged Sourced by CyberArk, denies the AWS user permission to create a new version of the secret with new encrypted data.|
|**secretsmanager:TagResource**|Denies the AWS user permission to use the CyberArk* tag on a secret.|
|**secretsmanager:UntagResource**|Denies the AWS user permission to remove the Sourced by CyberArk tag or tags with a CyberArk prefix from a secret.|

1. Save the file as a JSON file, for example, **DenyPermission.json**.
2. In the AWS account, create a CloudFormation stack using the JSON file you just created. For instructions on creating stacks, see the [CloudFormation documentation](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-cli-creating-stack.html).

Use the following guidelines to create the stack for Secrets Hub:

  1. Use **Template is ready** and **Upload** to upload your JSON file.
  2. When prompted, provide values for the following parameters:
|Parameter|Description|
|---------|-----------|
|`SecretsManagerAccount`|The AWS Secrets Manager target secret store's account ID.|
|`SecretsManagerRegion`|The region of the AWS Secrets Manager target secret store.|
|`Policy name`|A meaningful name for the policy, for example, DenyPermissionsToUser. Do not use spaces in the policy name.|
|`UserRole`|The policy is added to this role in your account, thereby denying users with the role the defined permissions.|
  3. **Optional:** Secrets Hub does not require any additional options, but you can configure these if you need them.

The policy is added to the specified user role. You can see the updated role in the AWS Management Console > IAM console (**Roles** > **<UserRole>**). Users assigned this role are denied the defined permissions.