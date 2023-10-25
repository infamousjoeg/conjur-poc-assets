# dev-team-1

## Usage

### Dev-Team-1

1. Create a new **Folder** item.
2. In the **Folder Name** field, enter `Dev-Team-1`.

### Job1

1. Create a new **Freestyle project** item inside the `Dev-Team-1` folder.
2. In the **Job Name** field, enter `Job1`.
3. In the **Build Environment** section, check **Use secret text(s) or file(s)**.
4. Click **Add** and select **Conjur Secret Credential**.
5. Choose a name for the secret variable and select the secret to retrieve from Conjur from the dropdown.
6. If no secrets appear in the dropdown, click **Refresh Credentials** and reload the page.
7. If no secrets appear after refreshing, check that the Conjur Secret Credential Provider plugin is installed and configured correctly.

### Job2

1. Create a new **Pipeline** item inside the `Dev-Team-1` folder..
2. In the **Job Name** field, enter `Job2`.
3. In the **Pipeline** section, select **Pipeline script**.
4. Copy the contents of [Job2/Jenkinsfile](Job2/Jenkinsfile) into the **Script** field.
5. Save and build now.