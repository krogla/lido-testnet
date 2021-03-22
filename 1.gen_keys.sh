#!/bin/bash

source ./.env
set -e +u
set -o pipefail

PASSWORD=$(head -n 1 ./validators.pass)

docker run -it --rm -v "$(pwd):/data" lidofinance/deposit-cli existing-mnemonic \
    --chain pyrmont \
    --quiet \
    --validator_start_index=0 \
    --num_validators=3 \
    --folder=/data \
    --keystore_password=$PASSWORD \
    --mnemonic="$MNEMONIC" \
    --withdrawal_credentials=$WITHDRAWAL_CREDENTIALS
