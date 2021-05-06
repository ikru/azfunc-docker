#!/bin/sh

docker-compose exec "azfunc" bash -c "dotnet publish azfunc/*csproj -o ../out && cd ../out && zip app.zip -r * && curl -w 'curl: %{http_code}\n' --insecure -X POST -u \"ftpuser:password\" --data-binary \"@./app.zip\""