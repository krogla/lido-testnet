#!/bin/bash

source ./.env
set -e +u
set -o pipefail

docker run -it --rm -v "$(pwd):/data" sigp/lighthouse lighthouse \
    account validator import \
    --network pyrmont \
    --reuse-password \
    --datadir "/data" \
    --directory "/data/validator_keys" \
    --password-file "/data/validators.pass" 



