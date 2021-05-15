#!/bin/sh

docker-compose  exec "func-debug" bash -c "dotnet build azfunc/*.csproj && func start --functions HttpTrigger --no-build --prefix ./build/azfunc/Debug/netcoreapp3.1"
