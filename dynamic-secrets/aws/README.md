# AWS Dynamic Secrets

The AWS dynamic secrets feature generates AWS access credentials dynamically based on IAM policies. These credentials are generated with a lease.

## Setup

### AWS

1. Login with your AWS CLI to the relevant account.
2. Create the IAM user.\
`aws iam create-user --user-name my-conjur-issuer`
3. Create access keys for the user.\
`aws iam create-access-key --user-name my-conjur-issuer`
4. From the response, note the `AccessKeyId` and `SecretAccessKey`.
   1. Alternatively, set the `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` environment variables.
5. Create an IAM policy with the required permissions.\
`aws iam create-policy --policy-name my-issuer-policy --policy-document file://issuerpolicy.json`
6. Attach the policy to the IAM user. Make sure you replace `ACCOUNT_ID` with your AWS Account ID.\
`aws iam attach-user-policy --policy-arn arn:aws:iam::ACCOUNT_ID:policy/my-issuer-policy --user-name my-conjur-issuer`

### Conjur Cloud

1. Install the Conjur Cloud CLI from [https://cyberark.my.site.com/mplace/s/#software-aK42J000000L646SAC-]().
2. `conjur init -u https://subdomain.secretsmgr.cyberark.cloud/api`
3. `conjur login`
4. After logging in successfully, execute `./conjurpolicy.sh` to load the policy into Conjur. Be sure to execute it from the same directory as the script.
5. After successful load of the policy, deploy the [dynamic-secrets-aws](https://github.com/infamousjoeg/conjur-poc-assets/tree/main/jenkins/dev-team-1/dynamic-secrets-aws) project from the [jenkins](https://github.com/infamousjoeg/conjur-poc-assets/tree/main/jenkins) section of this repository.