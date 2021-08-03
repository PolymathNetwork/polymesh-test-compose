
# Polymesh Test Compose
This repo contains the setup to run a local single-node fork of a Polymesh network, based off a fork of one of our networks.

This is intended to be used for local development or CI integration test purposes.

## Prerequisite

- docker

- docker-compose


## Usage

### To start a local node

- Start a node:

```

docker-compose up -d

```

### To create a snapshot for CI/CD


1. Checkout to the desired branch on your local clone of [Polymesh](https://github.com/PolymathNetwork/Polymesh).

2. Follow the instructions on [Polymesh](https://github.com/PolymathNetwork/Polymesh) repository to build a node locally.

3. Locate the executable build in ```target/release/polymesh```. This will be used later to create a snapshot.

4. Clone [maxsam4/fork-off-substrate](https://github.com/maxsam4/fork-off-substrate) and install dependencies

    ```bash
    git clone https://github.com/maxsam4/fork-off-substrate.git
    cd fork-off-substrate
    npm i
    ```

5. Create a folder called `data` inside the top folder (`fork-off-substrate`).

    ```bash
    mkdir data
    ```
6. Copy the executable/binary of Polymesh node inside the data folder and rename it to `binary`.

7. Copy the runtime WASM blob of Polymesh to the data folder and rename it to `runtime.wasm`. To get the WASM blob, compile your Polymesh and look for `./target/release/wbuild/polymesh-runtime-develop/polymesh_runtime_develop.compact.wasm`

8. Run the script using the correct rpc url

        ```bash
        HTTP_RPC_ENDPOINT=http://78.47.38.110:9933 npm start
        ```

9. You should have the genesis file for the Polymesh inside the `data` folder. It will be called `fork.json`.

10. The `fork.json` file obtained from the repo can be saved under the [snapshots](./snapshots) directory and optionally referenced during runs like so:

```

SNAPSHOT_NAME=<file_name> docker-compose up -d

```
- A custom polymesh node version can also be provided like so:

```

POLYMESH_VERSION=<version> docker-compose up -d

```
The chain should be accessible through `ws://localhost:9944`
