# GitHub Conjur Secret Fetcher Action

## Usage

1. Ensure that a self-hosted runner is available with inbound access from `https://*.secretsmgr.cyberark.cloud` and outbound access to the same.
2. Add [test-action.yml](test-action.yml) to your POC GitHub repository in `.github/workflows`.
3. Run workflow using dispatch trigger on Workflow details.
