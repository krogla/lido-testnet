# scripts to run test validator

## brief

Set of scripts to generate 3 validator keys from predefined mnemonic and run `lighthouse` validators client.

## requirements

- linux/macos
- bash
- docker

## usage

- copy `.env.example` to `.env`
- update values in `.env`
- change storage password in `validators.pass` if need
- run scripts in order

## notes

Validators client starts with HTTP API enabled on `localhost:5062`, see API key in logs.
