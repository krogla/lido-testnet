#!/bin/bash

source ./.env
set -e +u
set -o pipefail

docker run -d --rm -v "$(pwd):/data" -p "127.0.0.1:5062:5062" sigp/lighthouse lighthouse \
    validator_client \
    --http \
    --network prater \
    --init-slashing-protection \
    --datadir "/data" \
    --beacon-nodes $BEACONNODE \
    --graffiti $GRAFFITI

