FROM ubuntu:latest

RUN apt-get update \
    && apt-get install -y \
        dotnet-runtime

COPY entrypoint.sh /entrypoint.sh

# Executes `entrypoint.sh` when the Docker container starts up
ENTRYPOINT ["/entrypoint.sh"]