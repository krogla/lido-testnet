#!/bin/bash

source ./.env
set -e +u
set -o pipefail

docker run -it --rm --pull "always" \
    -v "$(pwd):/data" \
    sigp/lighthouse:latest lighthouse \
    account validator import \
    --network prater \
    --reuse-password \
    --datadir "/data" \
    --directory "/data/validator_keys" \
    --password-file "/data/validators.pass" 



