#!/bin/sh

docker-compose  exec "func-debug" bash -c "dotnet build azfunc/*.csproj && func start --functions HttpTrigger --no-build --prefix azfunc/bin/Debug/netcoreapp3.1"
