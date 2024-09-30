using Microsoft.Extensions.Configuration;
using System;
using System.IO;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;

namespace ConjurSessionTokenApp
{
    class Program
    {
        private static async Task Main(string[] args)
        {
            // Load configuration from appsettings.json
            var builder = new ConfigurationBuilder()
                .SetBasePath(Directory.GetCurrentDirectory())
                .AddJsonFile("appsettings.json", optional: false, reloadOnChange: true);
            IConfiguration config = builder.Build();

            // Get Conjur settings from configuration
            string conjurUrl = config["ConjurSettings:ConjurUrl"] ?? throw new ArgumentNullException("ConjurUrl is missing in the configuration");
            string account = config["ConjurSettings:Account"] ?? throw new ArgumentNullException("Account is missing in the configuration");
            string username = config["ConjurSettings:Username"] ?? throw new ArgumentNullException("Username is missing in the configuration");
            string apiKey = config["ConjurSettings:ApiKey"] ?? throw new ArgumentNullException("ApiKey is missing in the configuration");
            string secretPath = config["ConjurSettings:SecretPath"] ?? throw new ArgumentNullException("SecretPath is missing in the configuration");

            // URL encode the username
            string urlEncodedUsername = Uri.EscapeDataString(username);

            // Endpoint for authenticating a user
            string authEndpoint = $"{conjurUrl}/authn/{account}/{urlEncodedUsername}/authenticate";

            // Set up the HttpClient
            using (HttpClient client = new HttpClient())
            {
                try
                {
                    // Add the Accept-Encoding header
                    client.DefaultRequestHeaders.Add("Accept-Encoding", "base64");

                    // Create request content (API key)
                    var requestContent = new StringContent(apiKey, Encoding.UTF8, "text/plain");

                    // Debug: Print about sending request
                    Console.WriteLine("+ Authenticating to Endpoint:");
                    Console.WriteLine(authEndpoint);

                    // Make the POST request to authenticate
                    HttpResponseMessage response = await client.PostAsync(authEndpoint, requestContent);
                    
                    // Ensure a successful response
                    response.EnsureSuccessStatusCode();

                    // Retrieve the session token (base64 encoded)
                    string sessionToken = await response.Content.ReadAsStringAsync();

                    // Debug: Print the session token
                    Console.WriteLine("+ Session Token Retrieved:");
                    Console.WriteLine(sessionToken);

                    // Now, retrieve the secret using the session token
                    string secretEndpoint = $"{conjurUrl}/secrets/{account}/variable/{secretPath}";

                    // Format session token for Authorization header
                    string sessionTokenFormatted = "token=\"" + sessionToken + "\"";

                    // Add Authorization header with the session token
                    client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Token", sessionTokenFormatted);

                    // Debug: Print about retrieving the secret
                    Console.WriteLine("+ Retrieving secret from ID:");
                    Console.WriteLine(secretEndpoint);

                    // Make the GET request to retrieve the secret
                    HttpResponseMessage secretResponse = await client.GetAsync(secretEndpoint);

                    // Ensure a successful response
                    secretResponse.EnsureSuccessStatusCode();

                    // Retrieve and output the secret
                    string secretValue = await secretResponse.Content.ReadAsStringAsync();
                    Console.WriteLine("+ Secret Value Retrieved:");
                    Console.WriteLine(secretValue);
                }
                catch (HttpRequestException httpEx)
                {
                    Console.WriteLine($"- HTTP Error: {httpEx.Message}");
                }
                catch (Exception ex)
                {
                    Console.WriteLine($"- An error occurred: {ex.Message}");
                }
            }
        }
    }
}