#!/bin/bash

source ./.env
set -e +u
set -o pipefail

PASSWORD=$(head -n 1 ./validators.pass)
START_INDEX=${START_INDEX:-0}
VALIDATORS_COUNT=${VALIDATORS_COUNT:-3}

if [ -z "$MNEMONIC" ]; then
    docker run -it --rm --pull "always" \
        -v "$(pwd):/data" \
        lidofinance/deposit-cli:latest new-mnemonic \
        --chain=prater \
        --quiet \
        --num_validators=$VALIDATORS_COUNT \
        --folder=/data \
        --keystore_password=$PASSWORD \
        --eth1_withdrawal_address=$WITHDRAWAL_ADDRESS \
        --mnemonic_language=english
else
    docker run -it --rm --pull "always" \
        -v "$(pwd):/data" \
        lidofinance/deposit-cli:latest existing-mnemonic \
        --chain=prater \
        --quiet \
        --validator_start_index=$START_INDEX \
        --num_validators=$VALIDATORS_COUNT \
        --folder=/data \
        --keystore_password=$PASSWORD \
        --eth1_withdrawal_address=$WITHDRAWAL_ADDRESS \
        --mnemonic="$MNEMONIC"
fi
