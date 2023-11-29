<div align="center">
<h1 align="center">
<img src="https://raw.githubusercontent.com/PKief/vscode-material-icon-theme/ec559a9f6bfd399b82bb44393651661b08aaf7ba/icons/folder-markdown-open.svg" width="100" />
<br>CONJUR-POC-ASSETS</h1>
<h3>◦ Unlock Secure Secrets with Conjur PoC Assets!</h3>
<h3>◦ Developed with the software and tools below.</h3>

<p align="center">
<img src="https://img.shields.io/badge/GNU%20Bash-4EAA25.svg?style=flat&logo=GNU-Bash&logoColor=white" alt="GNU%20Bash" />
<img src="https://img.shields.io/badge/YAML-CB171E.svg?style=flat&logo=YAML&logoColor=white" alt="YAML" />
<img src="https://img.shields.io/badge/Terraform-7B42BC.svg?style=flat&logo=Terraform&logoColor=white" alt="Terraform" />
<img src="https://img.shields.io/badge/PowerShell-5391FE.svg?style=flat&logo=PowerShell&logoColor=white" alt="PowerShell" />
<img src="https://img.shields.io/badge/JSON-000000.svg?style=flat&logo=JSON&logoColor=white" alt="JSON" />
</p>
<img src="https://img.shields.io/github/license/infamousjoeg/conjur-poc-assets?style=flat&color=5D6D7E" alt="GitHub license" />
<img src="https://img.shields.io/github/last-commit/infamousjoeg/conjur-poc-assets?style=flat&color=5D6D7E" alt="git-last-commit" />
<img src="https://img.shields.io/github/commit-activity/m/infamousjoeg/conjur-poc-assets?style=flat&color=5D6D7E" alt="GitHub commit activity" />
<img src="https://img.shields.io/github/languages/top/infamousjoeg/conjur-poc-assets?style=flat&color=5D6D7E" alt="GitHub top language" />
</div>

---

##  Table of Contents
- [Table of Contents](#table-of-contents)
- [Overview](#overview)
- [Features](#features)
- [Repository Structure](#repository-structure)
- [Modules](#modules)
- [Getting Started](#getting-started)
  - [Installation](#installation)
- [Contributing](#contributing)
    - [*Contributing Guidelines*](#contributing-guidelines)
- [License](#license)

---


##  Overview

The "Conjur PoC Assets" repository contains a collection of automation scripts and configurations designed to demonstrate and enable the integration of CyberArk Conjur, a secrets management solution, with various DevOps tools and environments. It includes examples across platforms such as Ansible, Azure DevOps, GitLab, Jenkins, Kubernetes, and Terraform to faciliate secure secret retrieval, management, and deployment processes. This collection serves as a practical resource for implementing robust secret management in infrastructure automation and continuous integration/continuous deployment pipelines.

---

##  Features

|    | Feature            | Description                                                                                                        |
|----|--------------------|--------------------------------------------------------------------------------------------------------------------|
| ⚙️ | **Architecture**   | Distributed toolset for secret management across varied platforms: Ansible, Jenkins, GitLab, Azure DevOps, and more. |
| 📄 | **Documentation**  | Inline, descriptive comments within configuration files provide guidance for system integration and usage.           |
| 🔗 | **Dependencies**   | Depends on CyberArk Conjur, External Secrets Operator, various CI/CD tools, and cloud providers like AWS and Azure. |
| 🧩 | **Modularity**     | Comprises small, focused components for different systems demonstrating clear separation of concerns.                |
| 🧪 | **Testing**        | No explicit tests included; assumes reliance on external test suites of integrated CI/CD and infrastructure tools.  |
| ⚡️  | **Performance**    | Not directly addressed; performance likely hinges on the specifics of external secret management systems.            |
| 🔐 | **Security**       | Employs CyberArk Conjur for secret management, indicating a focus on secure credential and secret handling.          |
| 🔀 | **Version Control**| Utilizes Git, with repository containing multiple file types and configurations for version-controlled workflows.     |
| 🔌 | **Integrations**   | Extensive integration with common DevOps, cloud, and infra services, centralized around CyberArk Conjur usage.       |
| 📶 | **Scalability**    | Configured to be used across diverse environments and scale with enterprise DevOps toolchains.                        |

---


##  Repository Structure

```sh
└── conjur-poc-assets/
    ├── ansible/
    │   ├── customcredtype/
    │   │   ├── injector.yml
    │   │   └── input.yml
    │   └── playbooks/
    │       ├── aap/
    │       └── conjur_variable/
    ├── azuredevops/
    │   ├── azure-pipelines.yml
    │   └── secrets.yml
    ├── gitlab/
    │   ├── jwt-output/
    │   │   ├── .gitlab-ci.yml
    │   └── retrieve-secret/
    │       ├── .gitlab-ci.yml
    ├── jenkins/
    │   ├── dev-team-1/
    │   │   ├── Job1.sh
    │   │   ├── Job2/
    │   └── dev-team-2/
    │       ├── Job1.sh
    │       ├── Job2/
    ├── kubernetes/
    │   └── eso/
    │       ├── conjur/
    │       └── fake/
    ├── secretshub/
    │   ├── aws/
    │   │   ├── cloudformation/
    │   │   └── terraform/
    │   └── azure/
    │       ├── arm/
    │       └── terraform/
    └── terraform/
        ├── main.tf
        ├── variables.tf
        └── versions.tf

```

---


##  Modules

<details closed><summary>Jwt-output</summary>

| File                                                                                                           | Summary                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| ---                                                                                                            | ---                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| [.gitlab-ci.yml](https://github.com/infamousjoeg/conjur-poc-assets/blob/main/gitlab/jwt-output/.gitlab-ci.yml) | The `.gitlab-ci.yml` file under `gitlab/jwt-output/` defines CI/CD pipeline configurations for a GitLab project, using base64 to encode and echo JWTs related to the CI jobs. It outlines three versions of the script. The first two versions directly output the base64-encoded job JWT provided by GitLab. The third version allows specifying an audience URL for an ID token (`ID_TOKEN_1`) and subsequently outputs the ID token encoded in base64 format. The audience URL is configurable, with a placeholder value pointing to a Conjur Cloud tenant. Comments within the file include example JWT payloads revealing details about the CI job environment. |

</details>

<details closed><summary>Retrieve-secret</summary>

| File                                                                                                                | Summary                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| ---                                                                                                                 | ---                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| [.gitlab-ci.yml](https://github.com/infamousjoeg/conjur-poc-assets/blob/main/gitlab/retrieve-secret/.gitlab-ci.yml) | The `.gitlab-ci.yml` file configures a GitLab CI/CD pipeline with three jobs, each using a different Docker image (`alpine`, `ubuntu`, and `ubi`). These jobs authenticate to CyberArk Conjur using JWTs from GitLab and retrieve an AWS account ID secret. After fetching the secret, the scripts echo the account ID and then print it with spaces between each character. Common environment variables for Conjur connection are predefined, with job-specific JWT tokens for authentication. |

</details>

<details closed><summary>Fake</summary>

| File                                                                                                                       | Summary                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| ---                                                                                                                        | ---                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| [secretStore.yaml](https://github.com/infamousjoeg/conjur-poc-assets/blob/main/kubernetes/eso/fake/secretStore.yaml)       | The `secretStore.yaml` file defines a `ClusterSecretStore` for Kubernetes to simulate secret storage with hardcoded data. It specifies a fake provider containing secret key-value pairs and simulates different secret versions for testing purposes. This setup is part of a larger proof-of-concept asset repository including Ansible, Azure DevOps, GitLab, Jenkins, Kubernetes, and Terraform configurations.                                                                                                                                                                                                                                                                                                            |
| [externalSecret.yaml](https://github.com/infamousjoeg/conjur-poc-assets/blob/main/kubernetes/eso/fake/externalSecret.yaml) | The provided code defines a Kubernetes ExternalSecret resource named "example-fake," which periodically syncs secrets from an external source into a Kubernetes secret named "secret-to-be-created-fake," with a refresh interval of 1 hour. It references a ClusterSecretStore called "fake" and specifies two data syncing strategies: one mapping a specific secret key (/foo/bar) to a local secretKey (foo_bar), and another extracting all keys under the given path (/foo/baz). This configuration is part of a Proof of Concept (PoC) asset structure for secret management across various environments and platforms, including Ansible, Azure DevOps, GitLab, Jenkins, Kubernetes, SecretsHub, and Terraform setups. |

</details>

<details closed><summary>Jwt-auth</summary>

| File                                                                                                                                  | Summary                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| ---                                                                                                                                   | ---                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| [secretStore.yaml](https://github.com/infamousjoeg/conjur-poc-assets/blob/main/kubernetes/eso/conjur/jwt-auth/secretStore.yaml)       | The provided directory tree represents a collection of asset configurations for infrastructure automation covering Ansible, Azure DevOps, Gitlab, Jenkins, Kubernetes, Secretshub, and Terraform. The specific code snippet from `kubernetes/eso/conjur/jwt-auth/secretStore.yaml` defines a Kubernetes External Secret Store configuration for a Conjur provider. It utilizes JWT authentication, connecting to a Conjur server at a specified URL and uses a service account reference for authorization with intended audiences for secret management.                                  |
| [externalSecret.yaml](https://github.com/infamousjoeg/conjur-poc-assets/blob/main/kubernetes/eso/conjur/jwt-auth/externalSecret.yaml) | The provided directory tree outlines various DevOps configuration and script files for tools like Ansible, Azure DevOps, GitLab, Jenkins, Kubernetes, Secret Hub, and Terraform. The specific code snippet is for a Kubernetes ExternalSecret object, which auto-syncs secrets from an external secrets manager, in this case, Conjur, into a Kubernetes cluster. It's configured to refresh every hour, referencing a "conjur-poc-jwt" SecretStore, and creates a Kubernetes secret named "eso-secret-from-conjur-jwt" containing the'address' data fetched from Conjur's specified path. |

</details>

<details closed><summary>Apikey-auth</summary>

| File                                                                                                                                     | Summary                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| ---                                                                                                                                      | ---                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| [secretStore.yaml](https://github.com/infamousjoeg/conjur-poc-assets/blob/main/kubernetes/eso/conjur/apikey-auth/secretStore.yaml)       | The provided directory tree outlines various configuration and script files for integrating secrets management in DevOps tools and environments such as Ansible, Azure DevOps, GitLab, Jenkins, Kubernetes, and Terraform. The specific code snippet is a Kubernetes manifest for an External Secrets Operator SecretStore resource, configuring it to use CyberArk Conjur as the secrets provider through API key authentication, referencing specific credentials stored in a Kubernetes Secret named `conjur-creds`. |
| [externalSecret.yaml](https://github.com/infamousjoeg/conjur-poc-assets/blob/main/kubernetes/eso/conjur/apikey-auth/externalSecret.yaml) | The code defines a Kubernetes external secret object, which syncs secrets from a SecretStore to a Kubernetes secret. It auto-refreshes every hour, referencing a'conjur-poc-apikey' SecretStore, and creates a Kubernetes secret named'eso-secret-from-conjur-apikey' with an owner-level creation policy. It maps the external'address' secret located at a given Vault path to the'address' key within the Kubernetes secret.                                                                                         |

</details>

<details closed><summary>Dev-team-1</summary>

| File                                                                                              | Summary                                                                                                                                                                                                                                                                                                                                                                                                                         |
| ---                                                                                               | ---                                                                                                                                                                                                                                                                                                                                                                                                                             |
| [Job1.sh](https://github.com/infamousjoeg/conjur-poc-assets/blob/main/jenkins/dev-team-1/Job1.sh) | The `Job1.sh` script, intended as a Jenkins job build step for `dev-team-1`, obfuscates environment variables `TEST_USERNAME` and `TEST_PASSWORD` by echoing them with spaces inserted between each character. The directory tree suggests a multi-platform DevOps project with infrastructure-as-code and CI/CD components across various environments like Ansible, Azure DevOps, GitLab, Jenkins, Kubernetes, and Terraform. |

</details>

<details closed><summary>Job2</summary>

| File                                                                                                           | Summary                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| ---                                                                                                            | ---                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| [Jenkinsfile](https://github.com/infamousjoeg/conjur-poc-assets/blob/main/jenkins/dev-team-1/Job2/Jenkinsfile) | The Jenkins pipeline script, located within `jenkins/dev-team-1/Job2`, defines a single stage for a job where two secrets, a username and a password, are retrieved from a Conjur vault. The retrieved credentials are then printed to the console with spaces between each character for obscurity.                                                                                                                                                                  |
| [Jenkinsfile](https://github.com/infamousjoeg/conjur-poc-assets/blob/main/jenkins/dev-team-2/Job2/Jenkinsfile) | The Jenkinsfile script within the "jenkins/dev-team-2/Job2" directory orchestrates a job that retrieves a username and password from Conjur, a secrets management service. It uses the `withCredentials` block to securely fetch these credentials, identified by'credentialsId', into environment variables'TEST_USERNAME' and'TEST_PASSWORD'. The credentials are then echoed and spaced using a `sed` command within shell scripts to demonstrate their retrieval. |

</details>

<details closed><summary>Dev-team-2</summary>

| File                                                                                              | Summary                                                                                                                                                                                                                                                                                                                                                                                            |
| ---                                                                                               | ---                                                                                                                                                                                                                                                                                                                                                                                                |
| [Job1.sh](https://github.com/infamousjoeg/conjur-poc-assets/blob/main/jenkins/dev-team-2/Job1.sh) | The directory tree outlines a collection of assets for a proof of concept involving Conjur, divided into various configuration management and deployment tools. The `jenkins/dev-team-2/Job1.sh` script, intended for a Jenkins job build step, formats and echos `TEST_USERNAME` and `TEST_PASSWORD` environment variables by inserting spaces between each character of their respective values. |

</details>

<details closed><summary>Conjur_variable</summary>

| File                                                                                                                                     | Summary                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| ---                                                                                                                                      | ---                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| [generic-example.yml](https://github.com/infamousjoeg/conjur-poc-assets/blob/main/ansible/playbooks/conjur_variable/generic-example.yml) | The provided code snippet is a YAML file defining an Ansible playbook located within the `ansible/playbooks/conjur_variable` directory of the `conjur-poc-assets` project. The playbook contains a single task to retrieve a secret from CyberArk Conjur using the `conjur_variable` lookup plugin and prints the secret to the standard output.                                                                                                                                                                                                                                                                                                       |
| [dynamic-example.yml](https://github.com/infamousjoeg/conjur-poc-assets/blob/main/ansible/playbooks/conjur_variable/dynamic-example.yml) | The Ansible playbook sets up SSH key-based authentication for remote hosts by retrieving a private SSH key from CyberArk Conjur, a secrets management system. It uses the `cyberark.conjur.conjur_variable` lookup plugin to fetch the SSH key associated with each host's `inventory_hostname`. The fetched key is stored as `ansible_ssh_private_key_file`. Additionally, there's a commented-out option for password-based SSH authentication. The `delegate_to: localhost` ensures this task runs on the Ansible control node, securing sensitive data with `no_log: yes`. A shell command to obtain the hostname is executed on the target hosts. |

</details>

<details closed><summary>Aap</summary>

| File                                                                                                                         | Summary                                                                                                                                                                                                                                                                                                                                                                               |
| ---                                                                                                                          | ---                                                                                                                                                                                                                                                                                                                                                                                   |
| [generic-example.yml](https://github.com/infamousjoeg/conjur-poc-assets/blob/main/ansible/playbooks/aap/generic-example.yml) | The code defines an Ansible playbook that retrieves a secret from CyberArk Conjur and outputs the secret's value to the console. The operation occurs on the localhost. The directory tree indicates a broader project structure with asset configurations for multiple environments and integration points, such as Azure DevOps, GitLab, Jenkins, Kubernetes, and Terraform setups. |

</details>

<details closed><summary>Customcredtype</summary>

| File                                                                                                            | Summary                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| ---                                                                                                             | ---                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| [injector.yml](https://github.com/infamousjoeg/conjur-poc-assets/blob/main/ansible/customcredtype/injector.yml) | The `injector.yml` file within the `ansible/customcredtype` directory defines a set of variables that are crucial for configuring an Ansible role or playbook to interact with a Conjur appliance. These variables include the Conjur account name, appliance URL, authentication login, and API key, which Ansible uses as external values (likely provided at runtime) to manage secrets securely in automated environments.                                                                                                        |
| [input.yml](https://github.com/infamousjoeg/conjur-poc-assets/blob/main/ansible/customcredtype/input.yml)       | The `input.yml` file defines configuration fields for a custom Ansible credential type related to Conjur, a secrets management system. It specifies four required fields: `conjur_authn_login`, `conjur_authn_api_key`, `conjur_account`, and `conjur_appliance_url`, with `conjur_authn_api_key` being marked as secret. Each field includes a label and help text to guide the user on what information to input. This setup enables Ansible to authenticate and interact with Conjur for secure handling of sensitive information. |

</details>

<details closed><summary>Azuredevops</summary>

| File                                                                                                               | Summary                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| ---                                                                                                                | ---                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| [azure-pipelines.yml](https://github.com/infamousjoeg/conjur-poc-assets/blob/main/azuredevops/azure-pipelines.yml) | The provided code is an Azure DevOps pipeline configuration that defines a build environment and executes two main tasks. The first task uses a custom extension identified by `secretBatchRetrievalConnector@1` to retrieve secrets from a service connection named "Conjur Cloud POC", storing the fetched secrets in variables defined by `secrets.yml`. The second task runs a Bash script that prints a masked version of the secret stored in `$(SECRET1)`, spacing out each character. A commented-out PowerShell task illustrates an alternative approach to parse and display the secret.                           |
| [secrets.yml](https://github.com/infamousjoeg/conjur-poc-assets/blob/main/azuredevops/secrets.yml)                 | The provided directory tree represents a collection of assets for a proof-of-concept involving Conjur, a tool for securely managing secrets. It includes Ansible scripts for custom credential types, Azure DevOps pipelines, GitLab CI configurations, Jenkins jobs for multiple development teams, Kubernetes configurations, cloud infrastructure code for AWS and Azure within Secrets Hub, and Terraform files. The `secrets.yml` file in the `azuredevops` directory appears to specify a secret (`SECRET1`) fetched from a vault within Conjur, indicating its role in secure secrets management for CI/CD pipelines. |

</details>

<details closed><summary>Terraform</summary>

| File                                                                                                                | Summary                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| ---                                                                                                                 | ---                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| [variables.tf](https://github.com/infamousjoeg/conjur-poc-assets/blob/main/terraform/variables.tf)                  | The code defines local variables and an input variable for a Terraform configuration, specifying Conjur Secrets Manager service details. It sets the Conjur appliance URL, account name, and workload ID (prefixed with "host/") for authentication. Additionally, it declares a string type input variable'conjur_api_key' with a description that includes the workload ID, intended for use as an API key credential.                                                                                    |
| [versions.tf](https://github.com/infamousjoeg/conjur-poc-assets/blob/main/terraform/versions.tf)                    | The `versions.tf` file within the `terraform` directory specifies constraints for using Terraform, requiring a minimum version of 1.0.0. It also defines the necessary'conjur' provider from CyberArk for managing secrets, indicating a structured organization of infrastructure-as-code assets with security integration.                                                                                                                                                                                |
| [main.tf](https://github.com/infamousjoeg/conjur-poc-assets/blob/main/terraform/main.tf)                            | The `terraform/main.tf` file configures a Conjur provider and retrieves a secret (an address) from a Conjur vault. It then outputs the secret as a sensitive value, ensuring it won't be displayed in plaintext in Terraform logs or console output. The provider setup includes the appliance URL, account, login, and API key, which are sourced from local values and a variable.                                                                                                                        |
| [variables.tf](https://github.com/infamousjoeg/conjur-poc-assets/blob/main/secretshub/azure/terraform/variables.tf) | The `variables.tf` file inside `secretshub/azure/terraform/` defines Terraform variables for an Azure infrastructure deployment. It specifies defaults for proof of concept (POC) name, resource group, admin username, and VM size, while requiring inputs for admin password and tenant ID, without defaults. These configurations set up the foundational parameters for the infrastructure, such as naming, authentication, and computational resources.                                                |
| [versions.tf](https://github.com/infamousjoeg/conjur-poc-assets/blob/main/secretshub/azure/terraform/versions.tf)   | The provided directory tree outlines a multi-platform DevOps project structure with configurations for automation tools (Ansible, Azure DevOps, GitLab, Jenkins), infrastructure orchestration (Kubernetes, Terraform), and secrets management (Conjur). The specific `versions.tf` file within the `secretshub/azure/terraform/` directory specifies the minimum Terraform version (1.0 or greater) and declares the use of the `azurerm` provider from HashiCorp for Azure resource management.           |
| [main.tf](https://github.com/infamousjoeg/conjur-poc-assets/blob/main/secretshub/azure/terraform/main.tf)           | The Terraform code defines infrastructure in Azure, creating a virtual network and subnet within a resource group, a network interface, a Windows virtual machine, and a key vault. The virtual network has a single subnet that permits key vault access. The VM is connected to the subnet via the network interface and uses a dynamic private IP. It's a Windows Server 2022 VM with admin credentials, managed disks, and connects to the key vault, which is restricted except for specified subnets. |

</details>

<details closed><summary>Denypermissions</summary>

| File                                                                                                                              | Summary                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| ---                                                                                                                               | ---                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| [variables.tf](https://github.com/infamousjoeg/conjur-poc-assets/blob/main/secretshub/aws/terraform/DenyPermissions/variables.tf) | The "variables.tf" is a Terraform configuration within a DevOps project that defines four string variables: `Policy` (a unique policy name without spaces), `UserRole` (the role to be denied permission), `SecretsManagerAccount` (AWS Secrets Manager account ID), and `SecretsManagerRegion` (the region of the AWS Secrets Manager). These variables likely correspond to an AWS policy that restricts certain roles from modifying Secrets Hub-managed secrets.                                                                                                                       |
| [outputs.tf](https://github.com/infamousjoeg/conjur-poc-assets/blob/main/secretshub/aws/terraform/DenyPermissions/outputs.tf)     | The provided code defines two output variables for a Terraform module located in'secretshub/aws/terraform/DenyPermissions'. The first output variable,'role_name_to_deny', holds the name of an AWS role to which a denial policy will be assigned. The second,'deny_policy_arn', stores the Amazon Resource Name (ARN) of a policy that restricts access to the AWS Secrets Manager. These outputs are likely used to communicate important values to other parts of the Terraform codebase.                                                                                              |
| [versions.tf](https://github.com/infamousjoeg/conjur-poc-assets/blob/main/secretshub/aws/terraform/DenyPermissions/versions.tf)   | The code snippet specifies version requirements for Terraform and the AWS provider; it dictates that at least Terraform version 1.0.0 and AWS provider version 3.0.0 from HashiCorp are required for infrastructure management operations within the associated Terraform configuration located at'secretshub/aws/terraform/DenyPermissions/versions.tf' in a multi-faceted DevOps project structure.                                                                                                                                                                                      |
| [main.tf](https://github.com/infamousjoeg/conjur-poc-assets/blob/main/secretshub/aws/terraform/DenyPermissions/main.tf)           | The provided Terraform configuration codifies an AWS IAM policy that denies permissions to modify or delete secrets in AWS Secrets Manager and to manage tags on secrets if they are tagged as sourced by CyberArk. It also creates an IAM policy attachment to apply this policy to a specified user role. The policy targets all secrets within the AWS account and region provided via variables and restricts specific actions like `UpdateSecret`, `PutSecretValue`, `DeleteSecret`, `TagResource`, and `UntagResource`. It employs tag-based conditions to enforce the restrictions. |

</details>

<details closed><summary>Allowsecretsaccess</summary>

| File                                                                                                                                 | Summary                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| ---                                                                                                                                  | ---                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| [variables.tf](https://github.com/infamousjoeg/conjur-poc-assets/blob/main/secretshub/aws/terraform/AllowSecretsAccess/variables.tf) | The "variables.tf" file under the "AllowSecretsAccess" directory in the "secretshub/aws/terraform" path defines four Terraform variables for an AWS Secrets Management policy. These include a policy name, CyberArk Secrets Hub Role ARN, AWS Secrets Manager account ID, and region, all of which are mandatory strings described to ensure correct configuration for a CyberArk-integrated secrets access policy in AWS.                                                                                                                                                                 |
| [outputs.tf](https://github.com/infamousjoeg/conjur-poc-assets/blob/main/secretshub/aws/terraform/AllowSecretsAccess/outputs.tf)     | The provided code defines two Terraform outputs within a "secretshub/aws/terraform" module for AWS IAM roles. These outputs are the ARN and the name of an IAM role that grants the CyberArk Secrets Hub permission to manage secrets in AWS Secrets Manager. The roles are referenced by their resource identifiers in Terraform.                                                                                                                                                                                                                                                          |
| [versions.tf](https://github.com/infamousjoeg/conjur-poc-assets/blob/main/secretshub/aws/terraform/AllowSecretsAccess/versions.tf)   | The given code snippet, located in the `secretshub/aws/terraform/AllowSecretsAccess/versions.tf` path, specifies the version constraints for a Terraform configuration. It requires a minimum Terraform version of 1.0.0 and mandates the use of the AWS provider with a minimum version of 3.0.0 from HashiCorp's public registry. This defines the execution environment for Terraform to ensure compatibility and prevent potential issues with older versions.                                                                                                                          |
| [main.tf](https://github.com/infamousjoeg/conjur-poc-assets/blob/main/secretshub/aws/terraform/AllowSecretsAccess/main.tf)           | The code defines a Terraform configuration for an AWS IAM role named "AllowSecretsAccessRole." This role allows the assumption of itself by an external CyberArk entity, as specified by the "CyberArkSecretsHubRoleARN" variable. The role contains an inline policy granting permissions to create, list, update, delete, describe, tag, and untag AWS Secrets Manager secrets, subject to certain conditions that include resource region matches and tags indicating association with CyberArk. It's designed to enforce policy compliance and integration with CyberArk's Secrets Hub. |

</details>

<details closed><summary>Cloudformation</summary>

| File                                                                                                                                         | Summary                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| ---                                                                                                                                          | ---                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| [AllowSecretsAccess.json](https://github.com/infamousjoeg/conjur-poc-assets/blob/main/secretshub/aws/cloudformation/AllowSecretsAccess.json) | The JSON file `AllowSecretsAccess.json` specifies an AWS CloudFormation template that defines an IAM Role with policies to allow specific operations on AWS Secrets Manager secrets. This role enables the CyberArk Secrets Hub to create, list, update, delete, describe, tag, and untag secrets, with conditions ensuring access is scoped by region, account ID, and tags attributing the source to CyberArk. Parameters accept inputs for defining a policy name, the role ARN of the Secrets Hub, as well as the Secrets Manager account and region. |
| [DenyPermission.json](https://github.com/infamousjoeg/conjur-poc-assets/blob/main/secretshub/aws/cloudformation/DenyPermission.json)         | The JSON file `DenyPermission.json` within the `secretshub/aws/cloudformation` directory defines an AWS CloudFormation template that creates an IAM policy. The policy denies permissions to update, put, delete, tag, or untag AWS Secrets Manager secrets tagged as sourced by CyberArk across all secrets in a specified account and region. The policy attaches to a specified IAM role, emphasing access control and tag-based security governance by CyberArk within AWS environments.                                                              |

</details>

<details closed><summary>Arm</summary>

| File                                                                                                                                              | Summary                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| ---                                                                                                                                               | ---                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| [SetupResourceGroup.json](https://github.com/infamousjoeg/conjur-poc-assets/blob/main/secretshub/azure/arm/SetupResourceGroup.json)               | This JSON file is an Azure Resource Manager (ARM) template defining infrastructure deployment for Azure. It specifies the creation of a virtual network with a single subnet, a network interface, a virtual machine (VM), and a KeyVault. The VM is configured with selectable size, predefined admin credentials, and uses Windows Server 2022 Datacenter edition. The KeyVault is secured with network ACLs referencing the subnet created. Parameters allow customization of naming, VM size, and admin credentials, with default values provided.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| [RegisterSecretsHub_EntraID.ps1](https://github.com/infamousjoeg/conjur-poc-assets/blob/main/secretshub/azure/arm/RegisterSecretsHub_EntraID.ps1) | This PowerShell script automates the process of registering an application with Azure Active Directory, creating a service principal, and configuring access policies or roles if necessary for interacting with a specified Azure Key Vault. 1. It checks if the provided Azure Resource Group and Key Vault exist.2. If they don't, or if the application display name is already in use, the script stops and outputs an error.3. Otherwise, it proceeds to create an Azure AD application and corresponding service principal.4. It sets up an application credential valid for one year.5. Depending on the Key Vault’s access configuration (using RBAC or traditional access policies), it either creates a new custom role with detailed permissions or sets an access policy on the Key Vault, granting the service principal access to manage secrets.6. The script outputs the application ID and a newly generated client secret. It also implements error handling and retry logic while assigning roles.Character count: 971 |

</details>

---

##  Getting Started

###  Installation

1. Clone the conjur-poc-assets repository:
```sh
git clone https://github.com/infamousjoeg/conjur-poc-assets
```

2. Change to the project directory:
```sh
cd conjur-poc-assets
```


---

##  Contributing

Contributions are welcome! Here are several ways you can contribute:

- **[Submit Pull Requests](https://github.com/infamousjoeg/conjur-poc-assets/blob/main/CONTRIBUTING.md)**: Review open PRs, and submit your own PRs.
- **[Join the Discussions](https://github.com/infamousjoeg/conjur-poc-assets/discussions)**: Share your insights, provide feedback, or ask questions.
- **[Report Issues](https://github.com/infamousjoeg/conjur-poc-assets/issues)**: Submit bugs found or log feature requests for INFAMOUSJOEG.

#### *Contributing Guidelines*

<details closed>
<summary>Click to expand</summary>

1. **Fork the Repository**: Start by forking the project repository to your GitHub account.
2. **Clone Locally**: Clone the forked repository to your local machine using a Git client.
   ```sh
   git clone <your-forked-repo-url>
   ```
3. **Create a New Branch**: Always work on a new branch, giving it a descriptive name.
   ```sh
   git checkout -b new-feature-x
   ```
4. **Make Your Changes**: Develop and test your changes locally.
5. **Commit Your Changes**: Commit with a clear and concise message describing your updates.
   ```sh
   git commit -m 'Implemented new feature x.'
   ```
6. **Push to GitHub**: Push the changes to your forked repository.
   ```sh
   git push origin new-feature-x
   ```
7. **Submit a Pull Request**: Create a PR against the original project repository. Clearly describe the changes and their motivations.

Once your PR is reviewed and approved, it will be merged into the main branch.

</details>

---

##  License


This project is protected under the [MIT](https://choosealicense.com/licenses/mit) License. For more details, refer to the [LICENSE]() file.

[**Return**](#Top)

---