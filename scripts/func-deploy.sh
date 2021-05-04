#!/bin/sh

docker-compose exec "azfunc" bash -c "dotnet watch --project azfunc/*csproj msbuild /t:RunFunction"