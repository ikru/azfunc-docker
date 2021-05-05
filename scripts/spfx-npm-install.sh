#!/bin/sh

docker-compose exec "spfx-debug" bash -c "npm rebuild node-sass@4.14.1 -no-bin-links && npm install --ignore-optional"
