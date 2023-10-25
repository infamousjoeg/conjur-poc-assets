# jenkins

## Usage

1. Install the `Conjur Secrets Plugin` from the Jenkins Plugin Manager.
2. In the **Manage Jenkins** section, click on **Configure System**.
3. In the **Conjur Appliance** section, enter the URL of your Conjur instance. If your Conjur instance is Conjur Cloud, append `/api`. Also, be sure to set the **Account** value to `conjur`.
4. Skip down to the next section titled "Conjur JWT Authentication", check to **Enable JWT Key Set endpoint** and **Enable Context Aware Credential Stores**.
5. Set the **Auth WebService ID** to `jenkins1`.
6. Set the **JWT Audience** to the address of your Conjur instance.
   1. `https://subdomain.secretsmgr.cyberark.cloud`
7. Click Save.