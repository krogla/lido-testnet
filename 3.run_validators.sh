#!/bin/bash

source ./.env
set -e +u
set -o pipefail

PORT=${PORT:-5062}
USER=${USER:-default}

if [ ! -z "$LOCAL" ]; then
    network="--network host"
fi

docker run -d --rm --name "validator-$USER" $network -v "$(pwd):/data" -p "127.0.0.1:$PORT:5062" sigp/lighthouse lighthouse \
    validator_client \
    --http \
    --network prater \
    --init-slashing-protection \
    --datadir "/data" \
    --beacon-nodes $BEACONNODE \
    --graffiti "$GRAFFITI"
