# Conjur Demo App (.NET)

A simple C# .NET Console application that demonstrates how to authenticate with Conjur Cloud using an API key and retrieve a secret from the Conjur vault.

## Features

- Authenticate to Conjur Cloud using an API key.
- Retrieve a session token.
- Use the session token to access secrets stored in Conjur.

## Prerequisites

- [.NET 6 SDK](https://dotnet.microsoft.com/download/dotnet) or higher.
- Access to a Conjur Cloud instance with appropriate credentials.
- `appsettings.json` file with proper configuration (detailed below).

## Setup Instructions

### 1. Install Dependencies

Navigate to the project directory and install the required NuGet packages:

```bash
dotnet add package Microsoft.Extensions.Configuration
dotnet add package Microsoft.Extensions.Configuration.Json
dotnet add package Microsoft.Extensions.Configuration.FileExtensions
```

### 3. Create the Configuration File

Create an `appsettings.json` file in the project root. This file will hold your Conjur settings:

```json
{
  "ConjurSettings": {
    "ConjurUrl": "https://your-conjur-cloud-url",
    "Account": "your-account",
    "Username": "your-username",
    "ApiKey": "your-api-key",
    "SecretPath": "path/to/secret/here"
  }
}
```

Replace the placeholders (`your-conjur-cloud-url`, `your-account`, etc.) with your actual Conjur instance details.

### 4. Build and Run the Application

To build and run the application, execute the following commands:

```bash
dotnet build
dotnet run
```

### 5. Expected Output

The application will authenticate to Conjur using your credentials, obtain a session token, and use that token to retrieve a secret from the specified path.

If successful, the output will display:

- The session token obtained from Conjur.
- The secret value retrieved from Conjur.

## Project Structure

- `Program.cs`: Main application logic.
- `appsettings.json`: Configuration file holding Conjur connection details.
- `.gitignore`: Files and folders to be excluded from version control.

## Important Notes

- **Security Warning**: Do not commit sensitive information like `apiKey` or secrets to the repository. Use environment variables or secure configuration methods for sensitive values.
- **Exception Handling**: This example includes basic error handling. For production use, consider more robust error and retry logic.

## Troubleshooting

1. **404 Not Found**: Ensure that the `ConjurUrl`, `account`, and `secretPath` are correctly configured and the user has permissions.
2. **Unauthorized**: Verify that the `apiKey` is correct and belongs to a user with access permissions to the secret.
3. **Configuration Missing**: Ensure `appsettings.json` is properly set up and contains all necessary values.

## Contributions

Feel free to fork the project, create a feature branch, and submit a pull request if you want to contribute to the development of this demo app.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contact

For any issues or questions, please reach out:

- **GitHub**: [infamousjoeg](https://github.com/infamousjoeg)
- **Twitter**: [@infamousjoeg](https://twitter.com/infamousjoeg)

## References

- [Conjur Cloud API Documentation](https://docs.cyberark.com/conjur-cloud/latest/en/Content/Developer/Conjur_API_Overview.htm)
- [.NET Documentation](https://learn.microsoft.com/en-us/dotnet/)
