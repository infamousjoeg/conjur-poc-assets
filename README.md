<div align="center">
<h1 align="center">
<img src="https://raw.githubusercontent.com/PKief/vscode-material-icon-theme/ec559a9f6bfd399b82bb44393651661b08aaf7ba/icons/folder-markdown-open.svg" width="100" />
<br>conjur-poc-assets
</h1>
<h3>◦ Unleash the power of conjur-poc-assets!</h3>
<h3>◦ Developed with the software and tools listed below.</h3>

<p align="center">
<img src="https://img.shields.io/badge/GNU%20Bash-4EAA25.svg?style&logo=GNU-Bash&logoColor=white" alt="GNU%20Bash" />
<img src="https://img.shields.io/badge/Terraform-7B42BC.svg?style&logo=Terraform&logoColor=white" alt="Terraform" />
<img src="https://img.shields.io/badge/PowerShell-5391FE.svg?style&logo=PowerShell&logoColor=white" alt="PowerShell" />
<img src="https://img.shields.io/badge/JSON-000000.svg?style&logo=JSON&logoColor=white" alt="JSON" />
<img src="https://img.shields.io/badge/Markdown-000000.svg?style&logo=Markdown&logoColor=white" alt="Markdown" />
</p>
<img src="https://img.shields.io/github/languages/top/infamousjoeg/conjur-poc-assets?style&color=5D6D7E" alt="GitHub top language" />
<img src="https://img.shields.io/github/languages/code-size/infamousjoeg/conjur-poc-assets?style&color=5D6D7E" alt="GitHub code size in bytes" />
<img src="https://img.shields.io/github/commit-activity/m/infamousjoeg/conjur-poc-assets?style&color=5D6D7E" alt="GitHub commit activity" />
<img src="https://img.shields.io/github/license/infamousjoeg/conjur-poc-assets?style&color=5D6D7E" alt="GitHub license" />
</div>

---

## 📒 Table of Contents
- [📒 Table of Contents](#-table-of-contents)
- [📍 Overview](#-overview)
- [📂 Project Structure](#-project-structure)
- [🧩 Modules](#-modules)
- [🤝 Contributing](#-contributing)

---


## 📍 Overview

The project consists of scripts and configuration files for integrating with Conjur, a secrets management system, and setting up permissions and access control for managing secrets in AWS Secrets Manager and Azure Key Vault. It provides a secure way to fetch and manage secret credentials during Jenkins CI/CD pipeline deployments, Terraform infrastructure provisioning, and Azure and AWS configuration management. This streamlines the management of sensitive information in a centralized and secure manner, enhancing security and best practices for secret management in a multi-cloud environment.

---


## 📂 Project Structure




---

## 🧩 Modules

<details closed><summary>Dev-team-1</summary>

| File                                                                                              | Summary                                                                                                                                         |
| ---                                                                                               | ---                                                                                                                                             |
| [Job1.sh](https://github.com/infamousjoeg/conjur-poc-assets/blob/main/jenkins/dev-team-1/Job1.sh) | This script executes two echo commands, which anonymize the username and password inputs. The sed command inserts a space after each character. |

</details>

<details closed><summary>Job2</summary>

| File                                                                                                           | Summary                                                                                                                                                                                                                       |
| ---                                                                                                            | ---                                                                                                                                                                                                                           |
| [Jenkinsfile](https://github.com/infamousjoeg/conjur-poc-assets/blob/main/jenkins/dev-team-1/Job2/Jenkinsfile) | This code retrieves secrets stored in Conjur and assigns them to variables: TEST_USERNAME and TEST_PASSWORD. The credentials are accessed using their respective IDs and printed with spaces inserted between each character. |
| [Jenkinsfile](https://github.com/infamousjoeg/conjur-poc-assets/blob/main/jenkins/dev-team-2/Job2/Jenkinsfile) | The code fetches secret credentials from Conjur using the Conjur plugin, retrieving them securely and storing them in environment variables for further use. The secrets are then printed in a modified format.               |

</details>

<details closed><summary>Dev-team-2</summary>

| File                                                                                              | Summary                                                                                                                                                     |
| ---                                                                                               | ---                                                                                                                                                         |
| [Job1.sh](https://github.com/infamousjoeg/conjur-poc-assets/blob/main/jenkins/dev-team-2/Job1.sh) | The code is a shell script that prompts the user to input their TEST_USERNAME and TEST_PASSWORD, then prints them with each character separated by a space. |

</details>

<details closed><summary>Terraform</summary>

| File                                                                                                                | Summary                                                                                                                                                                                                                                                                                              |
| ---                                                                                                                 | ---                                                                                                                                                                                                                                                                                                  |
| [variables.tf](https://github.com/infamousjoeg/conjur-poc-assets/blob/main/terraform/variables.tf)                  | The code sets up variables for connecting to the Conjur Secrets Manager service. It defines the Conjur appliance URL, Conjur account name, and Conjur Workload ID. Additionally, it specifies a variable for the Conjur API key.                                                                     |
| [versions.tf](https://github.com/infamousjoeg/conjur-poc-assets/blob/main/terraform/versions.tf)                    | This code is written in Terraform language. It sets the required version and providers, with "cyberark/conjur" as the source for the "conjur" provider.                                                                                                                                              |
| [main.tf](https://github.com/infamousjoeg/conjur-poc-assets/blob/main/terraform/main.tf)                            | This code leverages the Conjur provider to connect to a Conjur instance and retrieve a secret. It defines the Conjur URL, account, login credentials, and API key. It then fetches the secret named "conjur_test_account_address" and outputs its value in a sensitive manner.                       |
| [variables.tf](https://github.com/infamousjoeg/conjur-poc-assets/blob/main/secretshub/azure/terraform/variables.tf) | This code sets up variables for configuring an Azure environment. It includes parameters for POC name, resource group, VM settings, admin credentials, and tenant ID.                                                                                                                                |
| [versions.tf](https://github.com/infamousjoeg/conjur-poc-assets/blob/main/secretshub/azure/terraform/versions.tf)   | This code is a Terraform configuration file. It sets the required version of Terraform and specifies the required provider for managing Azure resources using the azurerm plugin from HashiCorp.                                                                                                     |
| [main.tf](https://github.com/infamousjoeg/conjur-poc-assets/blob/main/secretshub/azure/terraform/main.tf)           | This code provisions an Azure Virtual Machine (VM) with a Key Vault in a specified resource group and virtual network. It also sets up the necessary network interfaces, OS disk, and VM configuration. The Key Vault has network access control enabled to restrict access to the specified subnet. |

</details>

<details closed><summary>Denypermissions</summary>

| File                                                                                                                              | Summary                                                                                                                                                                                                                                         |
| ---                                                                                                                               | ---                                                                                                                                                                                                                                             |
| [variables.tf](https://github.com/infamousjoeg/conjur-poc-assets/blob/main/secretshub/aws/terraform/DenyPermissions/variables.tf) | The code consists of variables that define a policy, user role, AWS Secrets Manager's account ID, and region. These variables can be used to configure and customize access control for secrets managed by Secrets Hub.                         |
| [outputs.tf](https://github.com/infamousjoeg/conjur-poc-assets/blob/main/secretshub/aws/terraform/DenyPermissions/outputs.tf)     | The code generates two outputs: role_name_to_deny-name of the AWS role to assign deny policy to deny_policy_arn-ARN of the policy that denies access to the provided AWS Secrets Manager.                                                       |
| [versions.tf](https://github.com/infamousjoeg/conjur-poc-assets/blob/main/secretshub/aws/terraform/DenyPermissions/versions.tf)   | This code specifies that the required version of Terraform is 1.0.0 or higher and the required AWS provider version is 3.0.0 or higher.                                                                                                         |
| [main.tf](https://github.com/infamousjoeg/conjur-poc-assets/blob/main/secretshub/aws/terraform/DenyPermissions/main.tf)           | This code sets up an AWS IAM policy to deny users from updating, putting, or deleting secrets in AWS Secrets Manager. It also restricts tagging and untagging resources based on specific tag keys. The policy is then attached to an IAM role. |

</details>

<details closed><summary>Allowsecretsaccess</summary>

| File                                                                                                                                 | Summary                                                                                                                                                                                                                                              |
| ---                                                                                                                                  | ---                                                                                                                                                                                                                                                  |
| [variables.tf](https://github.com/infamousjoeg/conjur-poc-assets/blob/main/secretshub/aws/terraform/AllowSecretsAccess/variables.tf) | This code defines variables for Policy, CyberArkSecretsHubRoleARN, SecretsManagerAccount, and SecretsManagerRegion, used in a configuration management system.                                                                                       |
| [outputs.tf](https://github.com/infamousjoeg/conjur-poc-assets/blob/main/secretshub/aws/terraform/AllowSecretsAccess/outputs.tf)     | This code defines two Terraform outputs, `allow_secrets_access_role_arn` and `allow_secrets_access_role_name`. These outputs provide the ARN and name of the AWS IAM role that allows CyberArk Secrets Hub to manage secrets in AWS Secrets Manager. |
| [versions.tf](https://github.com/infamousjoeg/conjur-poc-assets/blob/main/secretshub/aws/terraform/AllowSecretsAccess/versions.tf)   | This code defines and specifies the required version of Terraform and the provider AWS. It ensures that the code is compatible with Terraform version 1.0.0 or higher and the AWS provider version 3.0.0 or higher.                                  |
| [main.tf](https://github.com/infamousjoeg/conjur-poc-assets/blob/main/secretshub/aws/terraform/AllowSecretsAccess/main.tf)           | This code sets up an AWS IAM role that allows access to Secrets Manager, including creating, updating, deleting, and listing secrets. The role is restricted by conditions based on resource and tag values.                                         |

</details>

<details closed><summary>Arm</summary>

| File                                                                                                                                              | Summary                                                                                                                                                                                                                                                                                                                                                                                 |
| ---                                                                                                                                               | ---                                                                                                                                                                                                                                                                                                                                                                                     |
| [RegisterSecretsHub_EntraID.ps1](https://github.com/infamousjoeg/conjur-poc-assets/blob/main/secretshub/azure/arm/RegisterSecretsHub_EntraID.ps1) | This code manages the creation of an Azure app registration, service principal, and access permissions to a Key Vault. It checks for resource group and Key Vault existence, creates a new app registration and service principal, and assigns access permissions to the Key Vault using either RBAC or access policies. Finally, it retrieves and displays the app client credentials. |

</details>


---

## 🤝 Contributing

Contributions are always welcome! Please follow these steps:
1. Fork the project repository. This creates a copy of the project on your account that you can modify without affecting the original project.
2. Clone the forked repository to your local machine using a Git client like Git or GitHub Desktop.
3. Create a new branch with a descriptive name (e.g., `new-feature-branch` or `bugfix-issue-123`).
```sh
git checkout -b new-feature-branch
```
4. Make changes to the project's codebase.
5. Commit your changes to your local branch with a clear commit message that explains the changes you've made.
```sh
git commit -m 'Implemented new feature.'
```
6. Push your changes to your forked repository on GitHub using the following command
```sh
git push origin new-feature-branch
```
7. Create a new pull request to the original project repository. In the pull request, describe the changes you've made and why they're necessary.
The project maintainers will review your changes and provide feedback or merge them into the main branch.