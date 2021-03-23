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
- run scripts in order: [./1.gen_keys.sh](1.gen_keys.sh) -> [./2.import_keys.sh](2.import_keys.sh) -> [./3.run_validators.sh](3.run_validators.sh)

At the end, you will get a running in background docker container with Lighthouse validators client.

To see logs:

- use command `docker ps` to find the running container id
- use command `docker logs -f <container_id>` to see the logs (`Ctrl-C` to stop)

## notes

Validators client starts with HTTP API enabled on `localhost:5062`, see API key in logs.
