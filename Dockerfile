FROM mcr.microsoft.com/dotnet/sdk:6.0

# Install git
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git

COPY entrypoint.sh /entrypoint.sh

# Executes `entrypoint.sh` when the Docker container starts up
ENTRYPOINT ["/entrypoint.sh"]