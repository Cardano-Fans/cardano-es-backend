#!/bin/sh
echo "Starting oura..."
sleep 60 && curl -X PUT http://es-container:9200/_template/oura.sink.v0 -H 'Content-Type: application/json' -d @/daemon/index-template.json && ./oura daemon --config /daemon/daemon.toml