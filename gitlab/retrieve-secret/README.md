# gitlab/retrieve-secret

This is a simple GitLab CI job that will retrieve a secret from Conjur and output it to stdout as a sensitive value that is masked. Audit can be used in Conjur to verify secret retrieval.

## Usage

### 1. Clone this repository:

```bash
git clone https://github.com/infamousjoeg/conjur-poc-assets.git
cd gitlab/retrieve-secret
```

### 2. Update the .gitlab-ci.yml file variables

Update the following variables in the .gitlab-ci.yml file:

- `AUDIENCE`: The audience of the JWT authenticator web service that will be used to authenticate to Conjur
- `CONJUR_ACCOUNT`: The Conjur account name
- `CONJUR_APPLIANCE_URL`: The Conjur appliance URL
  - If for Conjur Cloud, append `/api` to the end of the URL
- `CONJUR_AUTHN_JWT_SERVICE_ID`: The service identity of the JWT authenticator web service that will be used to authenticate to Conjur

### 3. Commit and push the changes

```bash
git add .
git commit -m "Updated variables"
git push
```

### 4. Verify the job ran successfully

Navigate to the GitLab project and click on the `retrieve-secret` job to verify success or failure. If successful, you can see the secret retrieval in the Conjur audit logs.