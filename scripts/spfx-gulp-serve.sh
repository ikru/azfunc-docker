#!/bin/sh

docker-compose exec "spfx-debug" bash -c "NODE_PATH=\"/app/node_modules\" gulp trust-dev-cert && gulp serve --nobrowser"
