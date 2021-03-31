#!/bin/bash

source ./.env
set -e +u
set -o pipefail

PORT=${PORT:-5062}
USER=${USER:-default}

if [ ! -z "$LOCAL" ]; then
    network="--network host"
fi

docker run -d --name "validator-$USER" $network -v "$(pwd):/data" -p "127.0.0.1:$PORT:$PORT" sigp/lighthouse lighthouse \
    validator_client \
    --http \
    --http-port $PORT \
    --network prater \
    --init-slashing-protection \
    --datadir "/data" \
    --beacon-nodes $BEACONNODE \
    --graffiti "$GRAFFITI"
