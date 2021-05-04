#!/bin/sh

docker-compose exec "func-debug" bash -c "dotnet watch --project azfunc/*csproj msbuild /t:RunFunction"