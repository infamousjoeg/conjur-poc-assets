# aap

## Usage

1. In the **Credentials** section, create a credential of the type "CyberArk Conjur Secrets Manager Lookup".
   1. Be sure to set the `Conjur Appliance URL` to the URL of your Conjur instance. If your Conjur instance is Conjur Cloud, **DO NOT** append `/api`.
   2. Be sure to prefix the `Host Identity` with `host/`.
2. Again, in the **Credentials** section, create your credential type you'd like to assign to your Job Template for use. For example, if you are creating a `Machine` credential, select it from the `Credential Type` dropdown.
3. Instead of typing in the Username and Password values, click the "magnifying glass" icon to the right of the field instead. This will take you through a series of prompts to select your Conjur secret.
4. In your Job Template, select the credential you created in step 2 in the `Credential` field.  Complete the rest of the required fields of the Job Template and execute it.