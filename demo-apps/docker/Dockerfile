# Start with Alpine Linux base image
FROM alpine:latest

# Install curl and jq
RUN apk add --no-cache curl jq

# Create a directory for the app and secrets
RUN mkdir -p /opt/app /run/secrets

# Copy the entrypoint script into the container
COPY entrypoint.sh /opt/app/entrypoint.sh

# Make entrypoint script executable
RUN chmod +x /opt/app/entrypoint.sh

# Set the entrypoint to the script
ENTRYPOINT ["/bin/sh", "/opt/app/entrypoint.sh"]