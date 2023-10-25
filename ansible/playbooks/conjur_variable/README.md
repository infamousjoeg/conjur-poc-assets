# conjur_variable

## Usage

### Ansible Automation Platform & AWX

1. As an Admin user, create a [custom credential type](../../customcredtype/README.md) in Ansible Automation Platform.
2. Create a credential using the new type `CyberArk Conjur REST API`.
   1. Be sure to set the `Conjur Appliance URL` to the URL of your Conjur instance. If your Conjur instance is Conjur Cloud, be sure to append `/api`.
   2. Be sure to prefix the `Workload Identity` with `host/`.
3. Run the playbook [generic-example.yml]() with the credential you created assigned to the Job Template.

### Ansible Open Source (ansible-playbook CLI)

1. Be sure to set the following environment variables:

```shell
export CONJUR_APPLIANCE_URL=https://subdomain.secretsmgr.cyberark.cloud/api
export CONJUR_ACCOUNT=conjur
export CONJUR_AUTHN_LOGIN=host/data/cd/ansible/automation-controller-team-1/controllers/onprem-controller
export CONJUR_AUTHN_API_KEY=xxxxxxxxxxxxxxxxx
```
2. Run the playbook [generic-example.yml]().
   1. `ansible-playbook -i localhost generic-example.yml`