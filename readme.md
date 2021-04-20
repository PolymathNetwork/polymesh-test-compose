# Polymesh Test Compose

This repo contains the setup to run a local single-node fork of a Polymesh network, based off a fork of one of our networks.
This is intended to be used for local development or CI integration test purposes.

## Prerequisite

- docker
- docker-compose

## Usage

- Start a node:
  ```
  docker-compose up -d
  ```
- Snapshots can be taken using [maxsam4/fork-off-substrate](https://github.com/maxsam4/fork-off-substrate). The `fork.json` file obtained from the repo can be saved under the [snapshots](./snapshots) directory and optionally referenced during runs like so:

  ```
  SNAPSHOT_NAME=<file_name> docker-compose up -d
  ```

The chain should be accessible through `ws://localhost:9944`
