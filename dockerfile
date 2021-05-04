
# docker build --rm -t core-tools:0.1 .
# docker run -ti core-tools:0.1 bash
# docker run -p 7071:7071 -ti new-function:0.1 bash
FROM mcr.microsoft.com/dotnet/core/sdk:3.1 as core-tools
ENV DOTNET_SYSTEM_NET_HTTP_USESOCKETSHTTPHANDLER=0
RUN apt-get update && apt-get install zip unzip
RUN wget https://github.com/Azure/azure-functions-core-tools/releases/download/3.0.3442/Azure.Functions.Cli.linux-x64.3.0.3442.zip --no-check-certificate
RUN unzip -d azure-functions-cli Azure.Functions.Cli.linux-x64.*.zip
RUN cd azure-functions-cli && \
    chmod +x func && chmod +x gozip
ENV PATH=/azure-functions-cli:$PATH

FROM core-tools as func-debug
ENV ASPNETCORE_ENVIRONMENT=SBX
RUN apt update && \
    apt -y install unzip && \
    apt -y install procps && \
    curl -sSL https://aka.ms/getvsdbgsh | /bin/sh /dev/stdin -v latest -l /vsdbg
WORKDIR /app

FROM node:14.15 as spfx-debug
RUN npm install gulp --global
RUN npm install yo --global
RUN npm install @microsoft/generator-sharepoint --global --unsafe-perm=true --allow-root
WORKDIR /app/spfx
RUN gulp trust-dev-cert
