# scripts to run test validator

## brief

Set of script to generate 3 validator keys from predefined mnemonic and run `lighthouse` validator client.

## requirements

- linux/macos
- bash
- docker

## usage

- copy `.env.example` to `.env`
- update values in `.env`
- change storage password in `validators.pass` if need
- run script in order

## notes

Validators client starts with HTTP API enabled on `localhost:5062`, see API key in logs.
