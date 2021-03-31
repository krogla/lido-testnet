#!/bin/bash

source ./.env
set -e +u
set -o pipefail

PASSWORD=$(head -n 1 ./validators.pass)

if [ -z "$MNEMONIC" ]; then
    docker run -it --rm --pull "always" -v "$(pwd):/data" lidofinance/deposit-cli:latest new-mnemonic \
        --chain prater \
        --quiet \
        --num_validators=3 \
        --folder=/data \
        --keystore_password=$PASSWORD \
        --withdrawal_credentials=$WITHDRAWAL_CREDENTIALS \
        --mnemonic_language=english
else
    docker run -it --rm --pull "always" -v "$(pwd):/data" lidofinance/deposit-cli:latest existing-mnemonic \
        --chain prater \
        --quiet \
        --validator_start_index=0 \
        --num_validators=3 \
        --folder=/data \
        --keystore_password=$PASSWORD \
        --withdrawal_credentials=$WITHDRAWAL_CREDENTIALS \
        --mnemonic="$MNEMONIC"
fi
